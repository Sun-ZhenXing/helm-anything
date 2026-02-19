# Grafana Loki

## Introduction

Grafana Loki is a horizontally scalable, highly available, multi-tenant log aggregation system inspired by Prometheus. It is designed to be very cost-effective and easy to operate.

## Installation

To install Grafana Loki, run:

```bash
make install
```

## Usage

After installation, verify the deployment:

```bash
kubectl get pods -n loki
```

To configure Loki as a data source in Grafana, use the URL:
`http://loki.loki.svc.cluster.local:3100`

## Documentation

- [Official Loki Documentation](https://grafana.com/docs/loki/latest/)
- [Helm Chart Source](https://github.com/grafana/helm-charts/tree/main/charts/loki)
