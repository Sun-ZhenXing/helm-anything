# Prometheus (kube-prometheus-stack)

## Introduction

kube-prometheus-stack collects Kubernetes manifests, Grafana dashboards, and Prometheus rules combined with documentation and scripts to provide easy to operate end-to-end Kubernetes cluster monitoring with Prometheus using the Prometheus Operator.

## Installation

To install Prometheus, run:

```bash
make install
```

## Usage

After installation, verify the deployment:

```bash
kubectl get pods -n prometheus
```

To access Prometheus UI:

```bash
kubectl port-forward svc/prometheus-kube-prometheus-prometheus 9090:9090 -n prometheus
```

Then open <http://localhost:9090> in your browser.

## Documentation

- [Official Prometheus Documentation](https://prometheus.io/docs/)
- [Helm Chart Source](https://github.com/prometheus-community/helm-charts)
