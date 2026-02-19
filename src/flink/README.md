# Apache Flink

## Introduction

Apache Flink is a framework and distributed processing engine for stateful computations over unbounded and bounded data streams. Flink has been designed to run in all common cluster environments, perform computations at in-memory speed and at any scale.

## Installation

To install Apache Flink Kubernetes Operator, run:

```bash
make install
```

## Usage

After installation, verify the deployment:

```bash
kubectl get pods -n flink
```

To deploy a Flink job, create a FlinkDeployment custom resource.

## Documentation

- [Official Flink Documentation](https://nightlies.apache.org/flink/flink-docs-stable/)
- [Flink Kubernetes Operator Documentation](https://nightlies.apache.org/flink/flink-kubernetes-operator-docs-stable/)
- [Helm Chart Source](https://github.com/apache/flink-kubernetes-operator)
