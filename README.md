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

The InfluxDB telemetry bridge is a GDS plugin that reads simulation data from a running InfluxDB v2 instance and republishes it as F' telemetry channels. This lets you visualize simulation results (from the digital twin) directly in the F' GDS UI — in the Channels tab, Sim Health tab, and other custom tabs.

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

---
 
## Running with the Digital Twin Simulation
 
This section describes how to run the digital twin CubeSat simulation and see live telemetry streaming into the F' GDS Sim Health tab.
 
### Prerequisites
 
- The [digital_twin_CubeSat](https://github.com/CHESS-mission/digital_twin_CubeSat) repo cloned locally
- Conda environment set up per the digital twin repo's README
- InfluxDB v2 running locally
- `.env` file configured in both repos (CHESS-MCS and digital_twin_CubeSat) with matching InfluxDB credentials

### Simulation config
 
In the digital twin repo, edit `data/simulation/simulation_template.json` to control the simulation timing:
 
```json
{
    "delta_t": 10,
    "delta_t_unit": "second",
    "duration_sim": 300,
    "duration_sim_unit": "second",
    "influxdb_delta_t": 10,
    "influxdb_delta_t_unit": "second",
    "run_real_time": true,
    ...
}
```
 
Key parameters:
- `delta_t` — simulation physics step size (seconds). Affects fidelity.
- `influxdb_delta_t` — how often the sim uploads data to InfluxDB. Should be >= `delta_t`.
- `run_real_time` — if `true`, the sim runs at wall-clock speed (1 simulated second = 1 real second). If `false`, the sim runs as fast as possible.
- `duration_sim` — total simulated time. With `run_real_time: true`, this equals wall-clock runtime.

Rules of thumb for matching the handler poll rate to the sim upload rate:
- `delta_t` ≤ `influxdb_delta_t` (sim can't upload faster than it computes)
- `INFLUXDB_POLL_INTERVAL` < `influxdb_delta_t` (handler should poll faster than the sim writes, to catch every batch promptly)
- A good default: `INFLUXDB_POLL_INTERVAL` ≈ `influxdb_delta_t / 2`

### Step-by-step: live streaming
 
The GDS and the simulation can be started in either order. The handler polls continuously and will pick up data whenever the sim starts writing to InfluxDB. If the sim wipes the bucket on startup, the handler detects this and resets its tracking automatically.
 
1. **Make sure InfluxDB is running** (usually `http://localhost:8086`).
2. **Start the GDS** (in the CHESS-MCS repo):
    ```bash
    cd ~/CHESS-MCS
    uv run fprime-gds
    ```
 
3. **Open the browser** at `http://127.0.0.1:5000/` and click the **"Sim Health"** tab. It will show "Waiting" until the sim starts producing data.
4. **Start the simulation** (in the digital twin repo, in a separate terminal):
    ```bash
    cd ~/digital_twin_CubeSat
    conda activate digital_twin_env
    python3 -W"ignore" src/main.py simulation_template.json orbit_template.json spacecraft_template.json ground_station_template.json mission_design_template.json
    ```
 
5. **Watch the Sim Health tab** — within a few seconds of the sim's first `Uploading data to InfluxDB...` message, you should see:
    - The status pill change from "Waiting" to "Receiving"
    - Channel values appear and update as the sim runs
    - Values color-coded green/yellow/orange/red based on threshold ranges
6. **Watch the handler terminal output** for confirmation:
    ```
    [InfluxDB bridge] Published 1 rows up to 2027-05-01 09:00:10+00:00
    [InfluxDB bridge] Published 1 rows up to 2027-05-01 09:00:20+00:00
    ...
    ```

    ```
 
### Running multiple simulations
 
The handler polls continuously. You can stop the sim and start a new run without restarting the GDS. The handler detects when the InfluxDB bucket has been wiped (by the new sim run) and resets its tracking automatically.
 
---
 
## Telemetry Threshold Ranges
 
Channel color-coding thresholds are defined in JSON files in `deployment-sim/dict/`:
 
- `tm_ranges_demo.json` — tightened thresholds for visual testing (colors change frequently)
- `tm_ranges.json` — realistic operational thresholds (create this when real values are available)
- `adcs_ranges.json` — ADCS subsystem thresholds from the [FDIR document](https://docs.google.com/spreadsheets/d/1vS7VbdedEP9m75_XpFtlD4uREVHPp9t3cPKoOQ1dLTs/edit?gid=775361942#gid=775361942)

### Updating thresholds
 
1. Edit the desired JSON ranges file.
2. Regenerate the F' dictionary channel entries:
    ```bash
    python deployment-sim/dict/generate_channels.py tm_ranges_demo.json
    ```
 
3. Replace the `DeploymentSim` channel block in `deployment-sim/dict/LocalTopologyDictionary.xml` with the output.
4. Restart the GDS.

### Switching range files
 
Set the `SIM_HEALTH_RANGES` environment variable in `.env`:
 
```
SIM_HEALTH_RANGES=tm_ranges_demo.json
```
 
Change to realistic ranges later:
 
```
SIM_HEALTH_RANGES=tm_ranges.json
```
 
The Sim Health tab loads thresholds from the Flask endpoint `/sim-health/ranges`, which serves whichever file `SIM_HEALTH_RANGES` points to.

---

## Contact
 
For questions about the InfluxDB integration, Sim Health tab, ADCS Health tab, or the telemetry pipeline, contact:
 
**Melina Daniilidis** — melina.daniilidis@epfl.ch

**Jon Kuçi** — jon.kuci@epfl.ch


