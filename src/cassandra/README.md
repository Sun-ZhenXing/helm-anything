# Apache Cassandra (K8ssandra)

## Introduction

Apache Cassandra is an open-source distributed NoSQL database management system designed to handle large amounts of data across many commodity servers. This deployment uses K8ssandra Operator, which provides a Kubernetes-native way to manage Cassandra clusters.

K8ssandra is a cloud-native distribution of Apache Cassandra that runs on Kubernetes. It includes automation for operational tasks such as repairs, backups, and monitoring.

## Installation

To install Cassandra, run:

```bash
make install
```

## Usage

After installation, you can create a Cassandra cluster:

```bash
# Check if operator is running
kubectl get pods -n cassandra

# Create a Cassandra cluster
kubectl apply -f - <<EOF
apiVersion: k8ssandra.io/v1alpha1
kind: K8ssandraCluster
metadata:
  name: demo
  namespace: cassandra
spec:
  cassandra:
    serverVersion: "4.0.1"
    datacenters:
      - metadata:
          name: dc1
        size: 3
        storageConfig:
          cassandraDataVolumeClaimSpec:
            storageClassName: standard
            accessModes: ["ReadWriteOnce"]
            resources:
              requests:
                storage: 10Gi
        config:
          jvmOptions:
            heapSize: 1Gi
EOF
```

## Configuration

The default configuration includes:

- K8ssandra Operator for managing Cassandra clusters
- Support for Cassandra 4.x
- Medusa for backup management
- Reaper for repair scheduling
- Metrics collection via Prometheus

## Features

- **Automated Repairs**: Reaper handles repair scheduling
- **Backup/Restore**: Medusa provides backup and restore capabilities
- **Monitoring**: Integrated Prometheus metrics
- **Multi-DC Support**: Deploy across multiple data centers

## Connecting to Cassandra

```bash
# Get CQLSH access
kubectl exec -it demo-dc1-default-sts-0 -n cassandra -c cassandra -- cqlsh
```

## Uninstall

To uninstall:

```bash
make uninstall
```
