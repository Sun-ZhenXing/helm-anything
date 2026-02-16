# RabbitMQ

## Introduction

RabbitMQ is the most widely deployed open source message broker.

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
