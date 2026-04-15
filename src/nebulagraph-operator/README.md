# NebulaGraph Operator

## Introduction

NebulaGraph Operator is a Kubernetes operator that automates the deployment, scaling, and management of NebulaGraph clusters. It extends Kubernetes with Custom Resource Definitions (CRDs) for managing NebulaGraph components.

This chart installs the NebulaGraph Operator only. To deploy a NebulaGraph cluster, see the [nebulagraph](../nebulagraph/) directory.

## Installation

To install the NebulaGraph Operator, run:

```bash
make install
```

## Usage

After installation, verify the operator is running:

```bash
kubectl get pods -n nebula-operator-system
```

Check that CRDs are registered:

```bash
kubectl get crd | grep nebula
```

## Uninstall

To uninstall:

```bash
make uninstall
```

## Documentation

- [NebulaGraph Operator Documentation](https://docs.nebula-graph.io/master/k8s-operator/1.introduction/)
- [NebulaGraph Operator GitHub](https://github.com/vesoft-inc/nebula-operator)
