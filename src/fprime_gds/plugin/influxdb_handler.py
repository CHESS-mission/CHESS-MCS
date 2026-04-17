"""
DataHandler plugin that reads simulation telemetry from InfluxDB
and republishes it as F' GDS telemetry channels.
"""
import os
import threading
import time

from fprime_gds.common.handlers import DataHandlerPlugin
from fprime_gds.plugin.definitions import gds_plugin
from fprime.common.models.serialize.time_type import TimeType

from influxdb_client import InfluxDBClient

# F' channel name → InfluxDB field name
CHANNEL_MAP = {
    "DeploymentSim.Altitude":    "altitude",
    "DeploymentSim.Battery":     "battery",
    "DeploymentSim.Mode":        "modes",
    "DeploymentSim.Consumption": "consumption",
    "DeploymentSim.Generation":  "generation",
    "DeploymentSim.Eclipse":     "eclipse",
    "DeploymentSim.Visibility":  "visibility",
    "DeploymentSim.Latitude":    "Lat",
    "DeploymentSim.Longitude":   "Lng",
    "DeploymentSim.Storage":     "data",
}


@gds_plugin(DataHandlerPlugin)
class InfluxDbTelemetryBridge(DataHandlerPlugin):
    """
    Reads simulation telemetry from InfluxDB and publishes it
    as F' GDS telemetry channels. Polls at a configurable interval.
    """

    def get_handled_descriptors(self):
        return []

    @classmethod
    def get_name(cls):
        return "influxdb-telemetry-bridge"

    @classmethod
    def get_arguments(cls):
        return {
            ("--influxdb-url",): {
                "type": str,
                "default": "http://localhost:8086",
                "help": "InfluxDB server URL",
            },
            ("--influxdb-token",): {
                "type": str,
                "default": None,
                "help": "InfluxDB API token (or set INFLUXDB_TOKEN env var)",
            },
            ("--influxdb-org",): {
                "type": str,
                "default": "EST",
                "help": "InfluxDB organization",
            },
            ("--influxdb-bucket",): {
                "type": str,
                "default": "NICE",
                "help": "InfluxDB bucket name",
            },
            ("--influxdb-poll-interval",): {
                "type": float,
                "default": 5.0,
                "dest": "influxdb_poll_interval",
                "help": "Seconds between InfluxDB polls (default: 5.0)",
            },
        }

    def __init__(self, influxdb_url, influxdb_token, influxdb_org,
                 influxdb_bucket, influxdb_poll_interval, **kwargs):
        super().__init__(**kwargs)
        token = (influxdb_token or os.environ.get("INFLUXDB_TOKEN") or "").strip()
        self._client = InfluxDBClient(url=influxdb_url, token=token, org=influxdb_org)
        self._query_api = self._client.query_api()
        self._org = influxdb_org
        self._bucket = influxdb_bucket
        self._poll_interval = influxdb_poll_interval
        self._last_time = None
        self._thread = None

    def data_callback(self, data, source=None):
        pass

    def set_publisher(self, publisher):
        super().set_publisher(publisher)
        self._thread = threading.Thread(target=self._poll_loop, daemon=True)
        self._thread.start()

    def _poll_loop(self):
        while True:
            try:
                self._fetch_and_publish()
            except Exception as exc:
                print(f"[InfluxDB bridge] Error: {exc}")
            time.sleep(self._poll_interval)

    def _fetch_and_publish(self):
        """Query InfluxDB for new rows and publish each as F' channels."""
        # On first run, grab everything since 2020 (covers the test data that has synthetic time steps).
        # On subsequent runs, only fetch rows newer than what we've seen.
        if self._last_time is None:
            time_filter = "range(start: 2020-01-01T00:00:00Z)"
        else:
            ts = self._last_time.strftime("%Y-%m-%dT%H:%M:%S.%fZ")
            time_filter = f"range(start: {ts})"

        query = f'''
            from(bucket: "{self._bucket}")
              |> {time_filter}
              |> filter(fn: (r) => r._measurement == "satellite_data")
              |> sort(columns: ["_time"])
        '''

        tables = self._query_api.query(query, org=self._org)

        # Group results by timestamp: {ts: {field: value}}
        rows = {}
        for table in tables:
            for record in table.records:
                ts = record.get_time()
                if self._last_time is not None and ts <= self._last_time:
                    continue
                rows.setdefault(ts, {})[record.get_field()] = record.get_value()

        if not rows:
            return

        for ts in sorted(rows.keys()):
            row = rows[ts]
            # Convert pandas/datetime timestamp to F' TimeType (seconds + microseconds)
            fprime_time = TimeType()
            fprime_time.seconds = int(ts.timestamp())
            fprime_time.useconds = ts.microsecond
            for channel_name, field_name in CHANNEL_MAP.items():
                if field_name in row:
                    self.publisher.publish_channel(channel_name, row[field_name], fprime_time)
            self._last_time = ts    

        print(f"[InfluxDB bridge] Published {len(rows)} rows up to {self._last_time}")
        