# MLflow

## Introduction

MLflow is an open-source platform to manage the ML lifecycle, including experimentation, reproducibility, deployment, and a central model registry.

## Installation

To install MLflow, run:

```bash
make install
```

## Usage

After installation, verify the deployment:

```bash
kubectl get pods -n mlflow
```

To access MLflow UI:

```bash
kubectl port-forward svc/mlflow 5000:5000 -n mlflow
```

Then open <http://localhost:5000> in your browser.

## Documentation

- [Official MLflow Documentation](https://mlflow.org/docs/latest/index.html)
- [Helm Chart Source](https://github.com/community-charts/helm-charts/tree/main/charts/mlflow)
