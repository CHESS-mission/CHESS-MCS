#!/usr/bin/env bash
set -e

source .venv/bin/activate

uvicorn command_reciever:app --host 0.0.0.0 --port 8091 &
API_PID=$!

cleanup() {
  kill $API_PID 2>/dev/null || true
}
trap cleanup EXIT

cd DeploymentSim
fprime-gds -n --dictionary ../build-artifacts/Linux/DeploymentSim/dict/DeploymentSimTopologyDictionary.json