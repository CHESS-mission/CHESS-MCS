"""
DataHandler plugin that reads simulation telemetry from InfluxDB
and republishes it as F' GDS telemetry channels.
"""
import os
import threading
import time

from dotenv import load_dotenv
from fprime_gds.common.handlers import DataHandlerPlugin
from fprime_gds.plugin.definitions import gds_plugin
from fprime.common.models.serialize.time_type import TimeType

from influxdb_client import InfluxDBClient

# Load .env from the repo root
load_dotenv()

# F' channel name → InfluxDB field name
CHANNEL_MAP = {
    "DeploymentSim.Altitude":              "altitude",
    "DeploymentSim.Battery":               "battery",
    "DeploymentSim.Mode":                  "modes",
    "DeploymentSim.Consumption":           "consumption",
    "DeploymentSim.Generation":            "generation",
    "DeploymentSim.Eclipse":               "eclipse",
    "DeploymentSim.Visibility":            "visibility",
    "DeploymentSim.Latitude":              "Lat",
    "DeploymentSim.Longitude":             "Lng",
    "DeploymentSim.Storage":               "data",
    "DeploymentSim.RAAN":                  "RAAN",
    "DeploymentSim.AOP":                   "AOP",
    "DeploymentSim.ECC":                   "ECC",
    "DeploymentSim.INC":                   "INC",
    "DeploymentSim.Density":               "density",
    "DeploymentSim.SolarCellsEfficiency":  "solar_cells_efficiency",
    "DeploymentSim.StoragePayload":        "data_payload",
    "DeploymentSim.StorageHK":             "data_HK",
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
        # CLI args not strictly necessary since we have .env for inputting credentials,
        # but may still be helpful to have for flexibility, debugging, and documentation
        return {
            ("--influxdb-url",): {
                "type": str,
                "default": os.environ.get("INFLUXDB_URL", "http://localhost:8086"),
                "help": "InfluxDB server URL (env: INFLUXDB_URL)",
            },
            ("--influxdb-token",): {
                "type": str,
                "default": os.environ.get("INFLUXDB_TOKEN"),
                "help": "InfluxDB API token (env: INFLUXDB_TOKEN)",
            },
            ("--influxdb-org",): {
                "type": str,
                "default": os.environ.get("INFLUXDB_ORG", "EST"),
                "help": "InfluxDB organization (env: INFLUXDB_ORG)",
            },
            ("--influxdb-bucket",): {
                "type": str,
                "default": os.environ.get("INFLUXDB_BUCKET", "NICE"),
                "help": "InfluxDB bucket name (env: INFLUXDB_BUCKET)",
            },
            ("--influxdb-poll-interval",): {
                "type": float,
                "default": float(os.environ.get("INFLUXDB_POLL_INTERVAL", 5.0)),
                "dest": "influxdb_poll_interval",
                "help": "Seconds between InfluxDB polls (env: INFLUXDB_POLL_INTERVAL)",
            },
        }

    def __init__(self, influxdb_url, influxdb_token, influxdb_org,
                 influxdb_bucket, influxdb_poll_interval, **kwargs):
        super().__init__(**kwargs)
        print(f"[InfluxDB bridge] __init__ called. Token set: {bool(influxdb_token)}")
        self._enabled = bool(influxdb_token)
        if not self._enabled:
            print("[InfluxDB bridge] No INFLUXDB_TOKEN set — bridge disabled. "
                "GDS will run normally without simulation data.")
            return
        self._client = InfluxDBClient(
            url=influxdb_url, token=influxdb_token.strip(), org=influxdb_org
        )
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
        if not self._enabled:
            return
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
        # Detect bucket wipe: if the most recent row in the bucket is older than
        # what we've already seen, the sim must have wiped and restarted. -> allows for multiple runs of the sim
        if self._last_time is not None:
            latest_query = f'''
                from(bucket: "{self._bucket}")
                |> range(start: 2020-01-01T00:00:00Z, stop: 2030-01-01T00:00:00Z)
                |> filter(fn: (r) => r._measurement == "satellite_data")
                |> last()
            '''
            latest_tables = self._query_api.query(latest_query, org=self._org)
            latest_ts = None
            for table in latest_tables:
                for record in table.records:
                    if latest_ts is None or record.get_time() > latest_ts:
                        latest_ts = record.get_time()
            
            if latest_ts is not None and latest_ts < self._last_time:
                print(f"[InfluxDB bridge] Bucket wipe detected — resetting tracking.")
                self._last_time = None

        # Build time filter
        if self._last_time is None:
            time_filter = "range(start: 2020-01-01T00:00:00Z, stop: 2030-01-01T00:00:00Z)"
        else:
            ts = self._last_time.strftime("%Y-%m-%dT%H:%M:%S.%fZ")
            time_filter = f"range(start: {ts}, stop: 2030-01-01T00:00:00Z)"

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
            print(f"[InfluxDB bridge] Polled — no new rows.")
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
