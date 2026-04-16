# CHESS-SIM Quick Start Guide

This repository contains the implementation of a simulated subsystem for a satellite using NASA’s F´ (F Prime) flight software framework. The objective is to build a component (`CsvTM`) that reads telemetric data from a CSV file and integrates it into an executable deployment (`DeploymentSim`) that can interact with the F´ GDS (Ground Data System). This guide explains how to launch the F' GDS interface, and see the channel `CsvValue` from the aforementioned component changing values every second, corresponding to the content in the file `sim_data.csv`.

Tested on **Ubuntu 22.04** (native Linux and WSL2).
No prior knowledge of F′ is required.

---

## 1. System prerequisites

Install the minimal dependencies:

```bash
sudo apt update
sudo apt install -y \
  git \
  python3 \
  python3-venv \
  python3-pip \
  cmake \
  build-essential
```

---

## 2. Clone the repository

```bash
git clone https://github.com/PabloSarro/CHESS-MCS.git
cd CHESS-MCS
```

The repository already contains:

* the F′ project,
* the deployment,
* the simulation data,
* and all required configuration files.

## 1. System prerequisites

Install the minimal dependencies:

```bash
sudo apt update
sudo apt install -y \
  git \
  python3 \
  python3-venv \
  python3-pip \
  cmake \
  build-essential
```

---

## 2. Clone the repository

```bash
git clone https://github.com/PabloSarro/CHESS-MCS.git
cd CHESS-MCS
```

The repository already contains:

* the F′ project,
* the deployment,
* the simulation data,
* and all required configuration files.

Thus no project generation is needed.

---

## 3. Create and activate the Python virtual environment

```bash
python3 -m venv fprime-venv
source fprime-venv/bin/activate
```

All F′ tools and dependencies will live inside this environment.

---

## 4. Install Python dependencies

```bash
pip install -r requirements.txt
```

This installs:

* F′ core tools,
* the F′ GDS,
* and all required Python dependencies.

No additional packages are needed.

_Note: If you are running directly on a Linux system and see the error below,_

```
ERROR: Could not open requirements file: [Errno 2] No such file or directory: './lib/fprime/requirements.txt'
```

_this usually means that pip is able to find `requirements.txt`, but one of the files it references (the F′ framework `submodule`) hasn't been downloaded yet._

_Fix: Inside the `CHESS-MCS` directory, run_

```bash
git submodule update --init --recursive
```

_This will download the F′ framework into `lib/fprime`._
_After that, run the install command again:_

```bash
pip install -r requirements.txt
```

---

## 5. Generate and build the project

_Note: if you make changes to the existing project, start here immediately after saving your edits._

From the **repository root**:

```bash
fprime-util generate
fprime-util build
```

This step:

* generates F′ sources and dictionaries,
* builds the `DeploymentSim` executable,
* prepares the artifacts required by the GDS.

It only needs to be repeated if the source code changes.

---

## 6. Run the F′ Ground Data System (GDS)

```bash
fprime-gds
```

After a few seconds, the terminal will print:

```
Launched UI at: http://127.0.0.1:5000/
```

Open that address in a browser. You should see:

* the F′ GDS interface,
* telemetry updating once per second from `sim_data.csv`,
* the `DeploymentSim` executable running automatically.

---

## 7. Stopping and restarting

To stop the system:

```text
CTRL-C
```

If you restart immediately and encounter a temporary
`Address already in use` error, wait a few seconds and relaunch:

```bash
fprime-gds
```

---

## 8. Optional: Development with CLion

CLion is **not required** to run the project. However, it may be used optionally for development and code editing, but it is **outside the minimal execution path**.

---



