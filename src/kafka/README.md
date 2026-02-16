# Kafka

## Introduction

Apache Kafka is an open-source distributed event streaming platform used for high-performance data pipelines, streaming analytics, data integration, and mission-critical applications.

## Installation

To install Kafka, run:

```bash
make install
```

## Usage

After installation, verify the deployment:

```bash
kubectl get pods -n kafka
```

To produce and consume messages, use Kafka tools:

```bash
kubectl -n kafka exec -it kafka-cluster-kafka-0 -- kafka-console-producer.sh --broker-list kafka-cluster-kafka-bootstrap:9092 --topic test
```
