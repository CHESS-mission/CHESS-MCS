# fprime-gds Setup (uv)

## Prerequisites

- Python
- `uv`

## First-time setup
```powershell
cd CHESS-MCS
uv venv .venv
.\.venv\Scripts\Activate.ps1
uv sync
```
On Linux, run `source .venv/bin/activate` instead of `.\.venv\Scripts\Activate.ps1`.

## Subsequent sessions
The virtual environment only needs to be created once. After that, just activate it:
```powershell
.\.venv\Scripts\Activate.ps1
```
(or `source .venv/bin/activate` on Linux)

## Run

```powershell
uv run fprime-gds
```

Open `http://127.0.0.1:5000/` and stop with `Ctrl+C`.

If you see `Address already in use`, stop old processes and run again.

---

## InfluxDB Telemetry Bridge

The InfluxDB telemetry bridge is a GDS plugin that reads simulation data from a running InfluxDB v2 instance and republishes it as F' telemetry channels. This lets you visualize simulation results (from the digital twin) directly in the F' GDS UI — in the Channels, Charts, and Dashboard tabs (Note: Dashboard to-be-implemented).

### Prerequisites

- InfluxDB v2 running locally (or reachable over the network)
    - For instructions on setting up Influx DB v2, please see the **Installation & Setup** section of the [Grafana Visualization README](https://github.com/CHESS-mission/digital_twin_CubeSat/blob/dev_fabian/docs/doc_generation/grafana_visualization.rst) (DT repo).
- A bucket containing simulation data (e.g., populated by the digital twin or by uploading a CSV)
- An InfluxDB API token with read access to that bucket
    - The token can be generated from the InfluxDB UI under **API Tokens**. 

### Configuration

Create a `.env` file in the repo root with the InfluxDB credentials:

```bash
cat > ~/CHESS-MCS/.env <<'EOF'
INFLUXDB_TOKEN=your-token-here
INFLUXDB_ORG=EST
INFLUXDB_URL=http://localhost:8086
INFLUXDB_BUCKET=NICE
EOF
```

The `<<'EOF'` with single quotes around `EOF` prevents the shell from interpreting special characters (like `-` or `==`) that commonly appear in InfluxDB tokens.

Make sure `.env` is gitignored so the credentials don't get committed:

```bash
echo ".env" >> .gitignore
```

### Run

With a valid `.env` in place, just start the GDS as usual:

```powershell
uv run fprime-gds
```

The plugin starts automatically, polls InfluxDB every 5 seconds (configurable), and publishes new rows as F' telemetry channels. Open `http://127.0.0.1:5000/` and check the **Channels** tab — you should see values under the `DeploymentSim.*` channels (Altitude, Battery, Mode, etc.).

For live plots as data streams in, use the **Charts** tab.

Here is an alternative running command:

```powershell
uv run fprime-gds -n --dictionary <local-path-to-repo>/CHESS-MCS/deployment-sim/dict/LocalTopologyDictionary.xml
```

Use the longer comand when:

- You have multiple dictionaries and want to pick a specific one
- You're in a different working directory where auto-detection can't find things
- You want to be explicit for reproducibility (e.g., in a script or docs)

