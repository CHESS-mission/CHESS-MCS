# comand_reciever.py
from pathlib import Path
import shlex
import subprocess

from fastapi import FastAPI, HTTPException
from pydantic import BaseModel, Field


app = FastAPI(title="Command Receiver")


ROOT = Path(__file__).resolve().parent
DICT_PATH = ROOT / "build-artifacts" / "Linux" / "DeploymentSim" / "dict" / "DeploymentSimTopologyDictionary.json"


class CommandRequest(BaseModel):
    command: str
    arguments: list[str] = Field(default_factory=list)


@app.get("/health")
def health():
    return {"ok": True}


@app.post("/command-send")
def command_send(req: CommandRequest):
    if not DICT_PATH.exists():
        raise HTTPException(status_code=500, detail=f"Dictionary not found: {DICT_PATH}")

    cmd = [
        "fprime-cli",
        "command-send",
        "--tts-addr",
        "127.0.0.1",
        "--tts-port",
        "50050",
        "--dictionary",
        str(DICT_PATH),
        req.command,
        "--arguments",
        *[str(arg) for arg in req.arguments],
    ]

    print("[FPRIME CLI CMD]", " ".join(shlex.quote(x) for x in cmd))

    result = subprocess.run(
        cmd,
        capture_output=True,
        text=True,
        check=False,
        cwd=ROOT,
    )

    if result.stdout:
        print("[STDOUT]", result.stdout.strip())
    if result.stderr:
        print("[STDERR]", result.stderr.strip())

    if result.returncode != 0:
        raise HTTPException(
            status_code=500,
            detail=result.stderr.strip() or result.stdout.strip() or f"fprime-cli failed with code {result.returncode}",
        )

    return {
        "ok": True,
        "returncode": result.returncode,
        "stdout": result.stdout,
        "stderr": result.stderr,
    }