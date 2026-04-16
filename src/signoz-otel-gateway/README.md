# SigNoz OTel Gateway

## Introduction

SigNoz OTel Gateway is a standalone OpenTelemetry gateway component for SigNoz. It acts as a centralized ingestion endpoint that receives telemetry data (traces, metrics, logs) from applications or other collectors, and forwards them to a SigNoz backend (`signoz/signoz`).

Use this when you need:

- A unified public ingress point for OTLP data (HTTP/gRPC)
- Multi-cluster telemetry aggregation
- Heroku log drain or JSON HTTP log ingestion
- To separate the public-facing collector from the SigNoz backend

> **Prerequisites:** [SigNoz](../signoz/) must be installed first.

## Installation

```bash
make install
```

This deploys the gateway in the `platform` namespace. Before installing, update the exporter endpoint in `values.yaml` to point to your SigNoz OTel Collector service:

```yaml
config:
  exporters:
    otlp:
      endpoint: signoz-otel-collector.platform.svc.cluster.local:4317
```

## Usage

After installation, verify the gateway pod is running:

```bash
kubectl get pods -n platform -l app.kubernetes.io/name=signoz-otel-gateway
```

Send a test trace via OTLP HTTP:

```bash
kubectl port-forward svc/signoz-otel-gateway 4318:4318 -n platform
curl -X POST http://localhost:4318/v1/traces \
  -H "Content-Type: application/json" \
  -d '{"resourceSpans":[]}'
```

### Ingress Endpoints

| Protocol    | Host                       | Path                                    |
| ----------- | -------------------------- | --------------------------------------- |
| HTTP (OTLP) | `otel-gateway.example.com` | `/v1/traces`, `/v1/metrics`, `/v1/logs` |
| HTTP (logs) | `otel-gateway.example.com` | `/logs/json`, `/logs/heroku`            |
| gRPC (OTLP) | `otel-gateway.example.com` | gRPC service paths                      |

Update `otel-gateway.example.com` to your actual domain in `values.yaml`.

## Documentation

- [SigNoz OTel Gateway Chart](https://github.com/SigNoz/charts/tree/main/charts/signoz-otel-gateway)
- [SigNoz Documentation](https://signoz.io/docs/)
