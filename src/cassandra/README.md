# Apache Cassandra (K8ssandra)

## Introduction

Apache Cassandra is a free, open-source, distributed, wide-column store, NoSQL database management system designed to handle large amounts of data across many commodity servers. This chart deploys a K8ssandra cluster, which manages Cassandra using the K8ssandra Operator.

The K8ssandra Operator must be installed first — see the [cassandra-operator](../cassandra-operator/) directory.

## Installation

To install Apache Cassandra, run:

```bash
make install
```

## Usage

After installation, verify the deployment:

```bash
kubectl get pods -n cassandra
```

Check the Cassandra cluster status:

```bash
kubectl get k8ssandraclusters -n cassandra
```

Connect to Cassandra using cqlsh:

```bash
kubectl exec -it -n cassandra cassandra-cluster-dc1-default-sts-0 -- cqlsh
```

## Uninstall

To uninstall Cassandra:

```bash
make uninstall
```

## Documentation

- [K8ssandra Documentation](https://docs.k8ssandra.io/)
- [Apache Cassandra Documentation](https://cassandra.apache.org/doc/latest/)
- [K8ssandra Helm Chart](https://github.com/k8ssandra/k8ssandra-helm)
