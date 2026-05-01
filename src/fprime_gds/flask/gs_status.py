"""Ground-station status endpoint for CHESS-specific UI data."""

from copy import deepcopy
from datetime import UTC, datetime
from threading import Lock

import flask
import flask_restful


_STATUS_LOCK = Lock()
_LATEST_STATUS = {
    "available": False,
    "sequence": 0,
    "server_received_at_utc": None,
    "payload": None,
}


class GroundStationStatus(flask_restful.Resource):
    """Store and serve the most recently received ground-station status."""

    def get(self):
        with _STATUS_LOCK:
            return deepcopy(_LATEST_STATUS)

    def post(self):
        status_payload = flask.request.get_json(silent=True)
        if not isinstance(status_payload, dict):
            return {"errors": ["Expected a JSON object."]}, 400

        with _STATUS_LOCK:
            _LATEST_STATUS["available"] = True
            _LATEST_STATUS["sequence"] += 1
            _LATEST_STATUS["server_received_at_utc"] = datetime.now(UTC).isoformat()
            _LATEST_STATUS["payload"] = status_payload
            return deepcopy(_LATEST_STATUS), 202
