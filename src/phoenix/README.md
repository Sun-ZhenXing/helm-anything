# Phoenix

## Introduction

Arize Phoenix is an open-source tool for ML observability that runs in your notebook or application to visualize and monitor your model performance.

## Installation

To install Phoenix, run:

```bash
make install
```

## Usage

After installation, verify the deployment:

```bash
kubectl get pods -n phoenix
```

To access Phoenix, port-forward the service:

```bash
kubectl port-forward svc/phoenix 6006:6006 -n phoenix
```

Then access at <http://localhost:6006>
