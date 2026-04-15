# OpenLIT

## Introduction

OpenLIT is an open-source observability platform for AI/LLM applications. It provides monitoring, tracing, and analytics for AI workloads including OpenAI, HuggingFace, LangChain, and vector databases. This chart deploys the OpenLIT backend that receives and visualizes telemetry data.

For zero-code AI instrumentation of your applications, install the [openlit-operator](../openlit-operator/) which automatically injects OpenTelemetry instrumentation via init containers.

## Installation

To install OpenLIT, run:

```bash
make install
```

## Usage

After installation, verify the deployment:

```bash
kubectl get pods -n openlit
```

To access the OpenLIT dashboard, port-forward the service:

```bash
kubectl port-forward svc/openlit 8080:8080 -n openlit
```

Then access at <http://localhost:8080>

## Uninstall

To uninstall OpenLIT:

```bash
make uninstall
```

## Documentation

- [OpenLIT Documentation](https://docs.openlit.io/)
- [OpenLIT GitHub](https://github.com/openlit/openlit)
- [OpenLIT Operator](https://docs.openlit.io/latest/operator/overview)
