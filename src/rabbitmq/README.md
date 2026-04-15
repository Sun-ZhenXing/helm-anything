# RabbitMQ

## Introduction

RabbitMQ is the most widely deployed open source message broker.

This chart deploys a standalone RabbitMQ instance using the CloudPirates Helm chart. For operator-managed RabbitMQ clusters with advanced features like automatic scaling and self-healing, see the [rabbitmq-cluster-operator](../rabbitmq-cluster-operator/) directory.

## Installation

To install RabbitMQ, run:

```bash
make install
```

## Usage

After installation, verify the deployment:

```bash
kubectl get pods -n rabbitmq
```

To access RabbitMQ management UI, port-forward the service:

```bash
kubectl port-forward svc/rabbitmq 15672:15672 -n rabbitmq
```

Then access at <http://localhost:15672>
