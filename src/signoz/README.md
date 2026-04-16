# SigNoz

## Introduction

SigNoz is an open-source observability platform and APM (Application Performance Monitoring) tool. It helps developers monitor applications, troubleshoot problems, and gain insights into system performance. SigNoz is a self-hosted alternative to DataDog and NewRelic, built on OpenTelemetry.

Key features:

- Distributed tracing
- Metrics monitoring
- Log management
- Alerting and dashboards

## Prerequisites

- Kubernetes >= 1.22
- Helm >= 3.8
- 8 GB RAM minimum (16 GB recommended)
- 4 CPU cores minimum (8 recommended)
- 30 GB storage minimum

## Installation

```bash
make install
```

This will deploy SigNoz in the `platform` namespace.

## Usage

After installation, verify all pods are running:

```bash
kubectl get pods -n platform
```

To access the SigNoz UI:

```bash
kubectl port-forward svc/signoz-frontend 3301:3301 -n platform
```

Then open <http://localhost:3301> in your browser to access the SigNoz dashboard.

To verify the API is healthy:

```bash
kubectl port-forward svc/signoz 8080:8080 -n platform
curl http://localhost:8080/api/v1/health
# Expected: {"status":"ok"}
```

## Configuration

Edit `values.yaml` to customize the deployment. Key settings:

- `clickhouse.persistence.size` — Storage size for ClickHouse data (default: 20Gi)
- `frontend.replicaCount` — Number of frontend replicas
- `otelCollector.replicaCount` — Number of OpenTelemetry Collector replicas

For a full list of configuration options, run:

```bash
make values
```

## Documentation

- [Official SigNoz Documentation](https://signoz.io/docs/)
- [Helm Chart Source](https://github.com/SigNoz/charts)
- [SigNoz GitHub](https://github.com/SigNoz/signoz)
