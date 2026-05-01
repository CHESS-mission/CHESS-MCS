FROM python:3.13-slim

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1
ENV SETUPTOOLS_SCM_PRETEND_VERSION_FOR_FPRIME_GDS=0.0.0

WORKDIR /workspace/CHESS-MCS

# Install uv package manager used by CHESS-MCS setup
RUN pip install --no-cache-dir uv

# Copy the CHESS-MCS source tree from the current build context
COPY . ./

# Create the project environment from the lockfile
RUN uv sync --frozen --no-dev

EXPOSE 5000 50000

CMD ["uv", "run", "fprime-gds", "--no-zmq", "--tts-addr", "0.0.0.0", "--tts-port", "50000", "--gui-addr", "0.0.0.0", "--gui-port", "5000"]
