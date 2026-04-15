# CloudNativePG Operator

## Introduction

CloudNativePG is a Kubernetes operator for PostgreSQL that manages the entire PostgreSQL lifecycle — provisioning, replication, failover, backup, and monitoring — through Kubernetes-native CRDs.

This chart installs the CloudNativePG Operator only. PostgreSQL clusters are created through Cluster CRDs after the operator is installed.

## Installation

To install the CloudNativePG Operator, run:

```bash
make install
```

## Usage

After installation, verify the operator is running:

```bash
kubectl get pods -n cnpg-system
```

Check that CRDs are registered:

```bash
kubectl get crd | grep cnpg
```

### Create a PostgreSQL Cluster

```yaml
apiVersion: postgresql.cnpg.io/v1
kind: Cluster
metadata:
  name: postgres-cluster
spec:
  instances: 3
  storage:
    size: 1Gi
  postgresql:
    parameters:
      max_connections: '200'
```

Apply the manifest:

```bash
kubectl apply -f postgres-cluster.yaml
```

Check the cluster status:

```bash
kubectl get cluster -n postgres
```

Connect to PostgreSQL:

```bash
kubectl exec -it postgres-cluster-1 -n postgres -- psql
```

## Uninstall

To uninstall:

```bash
make uninstall
```

## Documentation

- [CloudNativePG Documentation](https://cloudnative-pg.io/documentation/)
- [CloudNativePG GitHub](https://github.com/cloudnative-pg/cloudnative-pg)
