# Apache Flink Kubernetes Operator

## Introduction

The Apache Flink Kubernetes Operator manages the lifecycle of Apache Flink applications on Kubernetes. This chart installs only the operator; Flink clusters are created through FlinkDeployment CRDs — there is no separate Flink cluster Helm chart.

A sample FlinkDeployment manifest is provided in `flink-deployment.yaml`.

## Installation

```bash
make install
```

## Usage

Verify the operator pods are running:

```bash
kubectl get pods -n flink-operator
```

Create a Flink cluster using the sample CRD:

```bash
kubectl apply -f flink-deployment.yaml -n flink
```

Check the deployed Flink resources:

```bash
kubectl get flinkdeployments -n flink
```

## Uninstall

```bash
make uninstall
```

## Documentation

- [Flink Kubernetes Operator Documentation](https://nightlies.apache.org/flink/flink-kubernetes-operator-docs-stable/)
- [Apache Flink Kubernetes Operator GitHub](https://github.com/apache/flink-kubernetes-operator)
