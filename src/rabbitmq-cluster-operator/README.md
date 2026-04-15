# RabbitMQ Cluster Operator

## Introduction

The RabbitMQ Cluster Operator is a Kubernetes operator that automates the deployment and management of RabbitMQ clusters on Kubernetes.

For a standalone RabbitMQ deployment (without operator), see the [rabbitmq](../rabbitmq/) directory.

## Installation

To install RabbitMQ Cluster Operator, run:

```bash
make install
```

## Usage

After installation, verify the deployment:

```bash
kubectl get pods -n rabbitmq-operator
```

To create a RabbitMQ cluster, apply a RabbitmqCluster custom resource:

```yaml
apiVersion: rabbitmq.com/v1beta1
kind: RabbitmqCluster
metadata:
  name: my-rabbitmq
  namespace: default
spec:
  replicas: 3
  resources:
    requests:
      cpu: 500m
      memory: 1Gi
    limits:
      cpu: 1
      memory: 2Gi
```

To access the RabbitMQ Management UI, port-forward the service:

```bash
kubectl port-forward svc/my-rabbitmq 15672:15672 -n default
```

Then access at <http://localhost:15672>

## Documentation

For more information, see:

- [RabbitMQ Cluster Operator GitHub](https://github.com/rabbitmq/cluster-operator)
- [RabbitMQ Documentation](https://www.rabbitmq.com/kubernetes/operator/operator-overview.html)
