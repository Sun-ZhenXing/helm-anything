# ClickHouse Operator

## 简介

Altinity ClickHouse Operator 是一个 Kubernetes Operator，用于管理 Kubernetes 上的 ClickHouse 集群。它通过 CRD 自动化 ClickHouse 实例的部署、扩缩容、配置和升级。

此 Chart 仅安装 ClickHouse Operator。ClickHouse 集群在 Operator 安装后通过 ClickHouseInstallation CRD 创建。

## 安装

安装 ClickHouse Operator：

```bash
make install
```

## 使用

安装完成后，验证 Operator 是否正常运行：

```bash
kubectl get pods -n clickhouse-operator
```

检查 CRD 是否已注册：

```bash
kubectl get crd | grep clickhouse
```

### 创建 ClickHouse 集群

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

应用清单：

```bash
kubectl apply -f clickhouse-cluster.yaml
```

检查集群状态：

```bash
kubectl get clickhouseinstallation -n clickhouse
```

## 卸载

卸载：

```bash
make uninstall
```

## 文档

- [ClickHouse Operator 文档](https://clickhouse.com/docs/en/manage/clickhouse-operator/)
- [Altinity ClickHouse Operator GitHub](https://github.com/Altinity/clickhouse-operator)
