# Strimzi Kafka Operator

## Introduction

Strimzi provides a way to run Apache Kafka on Kubernetes. The Strimzi Kafka Operator manages Kafka clusters, topics, and users through Custom Resource Definitions (CRDs).

This chart installs the Strimzi Kafka Operator only. Kafka clusters are created using Kafka CRDs after the operator is installed — there is no separate Kafka cluster Helm chart. A sample cluster definition is provided in `kafka-cluster.yaml`.

## Installation

To install the Strimzi Kafka Operator, run:

```bash
make install
```

## Usage

After installation, verify the operator is running:

```bash
kubectl get pods -n strimzi-operator
```

Create a Kafka cluster using the sample CRD:

```bash
kubectl apply -f kafka-cluster.yaml -n kafka
```

Check the cluster status:

```bash
kubectl get kafka -n kafka
```

## Uninstall

To uninstall:

```bash
make uninstall
```

## Documentation

- [Strimzi Documentation](https://strimzi.io/docs/)
- [Strimzi GitHub](https://github.com/strimzi/strimzi-kafka-operator)
