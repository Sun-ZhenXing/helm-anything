# OpenTelemetry Collector

## Introduction

OpenTelemetry Collector is a vendor-agnostic implementation on how to receive, process and export telemetry data.

## Installation

To install OpenTelemetry Collector, run:

```bash
make install
```

## Usage

After installation, verify the deployment:

```bash
kubectl get pods -n opentelemetry-collector
```

The collector will receive telemetry data based on its configuration and export it to configured backends.
