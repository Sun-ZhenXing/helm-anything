# OpenLIT Operator

## Introduction

OpenLIT Operator is a Kubernetes operator that provides zero-code AI observability for applications running in Kubernetes. It leverages OpenTelemetry to automatically instrument AI/LLM workloads (such as OpenAI, HuggingFace, LangChain, and vector databases) without any code changes, by injecting instrumentation via init containers.

For the OpenLIT backend that receives and visualizes telemetry data, see the [openlit](../openlit/) directory.

A sample AutoInstrumentation manifest is provided in `auto-instrumentation.yaml`.

## Installation

To install the OpenLIT Operator, run:

```bash
make install
```

## Usage

After installation, verify the operator is running:

```bash
kubectl get pods -n openlit
```

Create an `AutoInstrumentation` resource using the sample CRD:

```bash
kubectl apply -f auto-instrumentation.yaml -n default
```

Restart your application deployment to pick up the instrumentation:

```bash
kubectl rollout restart deployment <your-deployment-name>
```

## Uninstall

To uninstall:

```bash
make uninstall
```

## Documentation

- [OpenLIT Operator Overview](https://docs.openlit.io/latest/operator/overview)
- [Installation Guide](https://docs.openlit.io/latest/operator/installation)
- [Configuration](https://docs.openlit.io/latest/operator/configuration/operator)
