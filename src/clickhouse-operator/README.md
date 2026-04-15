# ClickHouse Operator

## Introduction

The Altinity ClickHouse Operator is a Kubernetes operator that manages ClickHouse clusters on Kubernetes. It automates deployment, scaling, configuration, and upgrades of ClickHouse instances using CRDs.

This chart installs the ClickHouse Operator only. ClickHouse clusters are created through ClickHouseInstallation CRDs after the operator is installed.

## Installation

To install the ClickHouse Operator, run:

```bash
make install
```

## Usage

After installation, verify the operator is running:

```bash
kubectl get pods -n clickhouse-operator
```

Check that CRDs are registered:

```bash
kubectl get crd | grep clickhouse
```

### Create a ClickHouse Cluster

```yaml
apiVersion: clickhouse.altinity.com/v1
kind: ClickHouseInstallation
metadata:
  name: clickhouse-cluster
spec:
  defaults:
    templates:
      dataVolumeClaimTemplate: data-volume-template
      podTemplate: clickhouse-pod-template
  configuration:
    clusters:
      - name: clickhouse-cluster
        layout:
          shardsCount: 1
          replicasCount: 1
    settings:
      log_level: information
  templates:
    podTemplates:
      - name: clickhouse-pod-template
        spec:
          containers:
            - name: clickhouse
              image: clickhouse/clickhouse-server:24.8
    volumeClaimTemplates:
      - name: data-volume-template
        spec:
          accessModes:
            - ReadWriteOnce
          resources:
            requests:
              storage: 10Gi
```

Apply the manifest:

```bash
kubectl apply -f clickhouse-cluster.yaml
```

Check the cluster status:

```bash
kubectl get clickhouseinstallation -n clickhouse
```

## Uninstall

To uninstall:

```bash
make uninstall
```

## Documentation

- [ClickHouse Operator Documentation](https://clickhouse.com/docs/en/manage/clickhouse-operator/)
- [Altinity ClickHouse Operator GitHub](https://github.com/Altinity/clickhouse-operator)
