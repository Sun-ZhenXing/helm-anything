# Grafana

## Introduction

Grafana is a multi-platform open-source analytics and interactive visualization web application. It provides charts, graphs, and alerts for the web when connected to supported data sources.

## Installation

To install Grafana, run:

```bash
make install
```

## Usage

After installation, verify the deployment:

```bash
kubectl get pods -n grafana
```

To access Grafana:

```bash
kubectl port-forward svc/grafana 3000:3000 -n grafana
```

Then open <http://localhost:3000> in your browser.

Default credentials: admin/admin

## Documentation

- [Official Grafana Documentation](https://grafana.com/docs/)
- [Helm Chart Source](https://github.com/grafana/helm-charts/tree/main/charts/grafana)
