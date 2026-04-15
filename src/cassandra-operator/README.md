# K8ssandra Operator

## Introduction

K8ssandra Operator is a Kubernetes operator that manages the lifecycle of Apache Cassandra clusters using K8ssandra. It handles provisioning, scaling, repair scheduling (Reaper), backup management (Medusa), and monitoring.

This chart installs the K8ssandra Operator only. To deploy a K8ssandra/Cassandra cluster using Helm, see the [cassandra](../cassandra/) directory. Alternatively, Cassandra clusters can be created with K8ssandraCluster CRDs — a sample cluster definition is provided in `k8ssandra-cluster.yaml`.

## Installation

To install the K8ssandra Operator, run:

```bash
make install
```

## Usage

After installation, verify the operator is running:

```bash
kubectl get pods -n k8ssandra-operator
```

Create a Cassandra cluster using the sample CRD:

```bash
kubectl apply -f k8ssandra-cluster.yaml -n cassandra
```

Check the cluster status:

```bash
kubectl get k8ssandraclusters -n cassandra
```

Connect with cqlsh once the cluster is ready:

```bash
kubectl exec -it -n cassandra cassandra-cluster-dc1-default-sts-0 -- cqlsh
```

Check that CRDs are registered:

```bash
kubectl get crd | grep k8ssandra
```

## Uninstall

To uninstall:

```bash
make uninstall
```

## Documentation

- [K8ssandra Documentation](https://docs.k8ssandra.io/)
- [K8ssandra Operator GitHub](https://github.com/k8ssandra/k8ssandra-operator)
