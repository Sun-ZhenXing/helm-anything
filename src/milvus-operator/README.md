# Milvus Operator

## Introduction

Milvus Operator is a Kubernetes operator that automates the deployment and management of Milvus vector database clusters on Kubernetes. It provides an easy solution to deploy and manage the full Milvus service stack including etcd, Pulsar, and MinIO in a scalable and highly available way.

This chart installs the Milvus Operator only. Milvus clusters are created through MilvusCluster CRDs after the operator is installed.

## Installation

To install the Milvus Operator, run:

```bash
make install
```

## Usage

After installation, verify the operator is running:

```bash
kubectl get pods -n milvus-operator
```

Check that CRDs are registered:

```bash
kubectl get crd | grep milvus
```

### Create a Milvus Cluster

```yaml
apiVersion: milvus.io/v1beta1
kind: MilvusCluster
metadata:
  name: my-milvus
  namespace: milvus
spec:
  components:
    image: milvusdb/milvus:v2.4.17
    proxy:
      replicas: 1
    rootCoord:
      replicas: 1
    dataCoord:
      replicas: 1
    indexCoord:
      replicas: 1
    queryCoord:
      replicas: 1
    dataNode:
      replicas: 1
    indexNode:
      replicas: 1
    queryNode:
      replicas: 1
  config:
    milvus:
      log:
        level: info
```

Apply the manifest:

```bash
kubectl apply -f milvus-cluster.yaml
```

Check the cluster status:

```bash
kubectl get milvuscluster -n milvus
```

## Uninstall

To uninstall:

```bash
make uninstall
```

## Documentation

- [Milvus Operator Documentation](https://github.com/zilliztech/milvus-operator)
- [Milvus Documentation](https://milvus.io/docs/)
