# Apache Pulsar

## Introduction

Apache Pulsar is a cloud-native, distributed messaging and streaming platform originally created at Yahoo! and now a top-level Apache Software Foundation project.

## Installation

To install Apache Pulsar, run:

```bash
make install
```

## Usage

After installation, verify the deployment:

```bash
kubectl get pods -n pulsar
```

To check Pulsar broker status:

```bash
kubectl exec -it pulsar-broker-0 -n pulsar -- bin/pulsar-admin brokers list
```

## Documentation

- [Official Apache Pulsar Documentation](https://pulsar.apache.org/docs/)
- [Helm Chart Source](https://github.com/apache/pulsar-helm-chart)
