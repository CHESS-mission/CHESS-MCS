# fprime-gds Setup (uv)

## Prerequisites

- Python
- `uv`

## Setup

```powershell
cd CHESS-MCS
uv venv .venv
.\.venv\Scripts\Activate.ps1
uv sync
```

On Linux, run `source .venv/bin/activate` instead of `.\.venv\Scripts\Activate.ps1`.

## Run

```powershell
uv run fprime-gds
```

Open `http://127.0.0.1:5000/` and stop with `Ctrl+C`.

If you see `Address already in use`, stop old processes and run again.
