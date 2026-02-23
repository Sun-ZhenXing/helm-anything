# Apache RocketMQ

## Introduction

Apache RocketMQ is a distributed messaging and streaming platform with low latency, high performance and reliability, trillion-level capacity and flexible scalability.

This Helm chart deploys Apache RocketMQ on Kubernetes, including NameServer, Broker, and Console components.

## Installation

To install RocketMQ, run:

```bash
make install
```

## Usage

After installation:

```bash
# Check if RocketMQ components are running
kubectl get pods -n rocketmq

# Port forward to access NameServer
kubectl port-forward svc/rocketmq-nameserver -n rocketmq 9876:9876

# Port forward to access Console (if enabled)
kubectl port-forward svc/rocketmq-console -n rocketmq 8080:8080
```

## Configuration

The default configuration includes:

- 2 NameServer replicas for high availability
- 1 Broker master with 1 slave (2m-2s sync_flush)
- Console for management UI
- Persistent storage for message data

## Components

- **NameServer**: Service discovery and routing
- **Broker**: Message storage and delivery
- **Console**: Web UI for management and monitoring

## Client Connection

```java
Properties props = new Properties();
props.setProperty("namesrvAddr", "rocketmq-nameserver.rocketmq:9876");
DefaultMQProducer producer = new DefaultMQProducer("TestProducer", props);
```

## Storage

Configure persistent storage for brokers:

```yaml
broker:
  storage:
    size: 50Gi
    class: standard
```

## Uninstall

To uninstall RocketMQ:

```bash
make uninstall
```
