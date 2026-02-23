# Apache Cassandra (K8ssandra)

## 简介

Apache Cassandra 是一个开源的分布式 NoSQL 数据库管理系统，设计用于在大量商用服务器上处理大量数据。此部署使用 K8ssandra Operator，它提供了一种 Kubernetes 原生的方式来管理 Cassandra 集群。

K8ssandra 是 Apache Cassandra 的云原生发行版，可在 Kubernetes 上运行。它包括修复、备份和监控等运维任务的自动化。

## 安装

安装 Cassandra：

```bash
make install
```

## 使用

安装完成后，您可以创建 Cassandra 集群：

```bash
# 检查 operator 是否运行
kubectl get pods -n cassandra

# 创建 Cassandra 集群
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

## 配置

默认配置包括：

- 用于管理 Cassandra 集群的 K8ssandra Operator
- 支持 Cassandra 4.x
- Medusa 用于备份管理
- Reaper 用于修复调度
- 通过 Prometheus 收集指标

## 功能

- **自动修复**: Reaper 处理修复调度
- **备份/恢复**: Medusa 提供备份和恢复功能
- **监控**: 集成的 Prometheus 指标
- **多 DC 支持**: 跨多个数据中心部署

## 连接 Cassandra

```bash
# 获取 CQLSH 访问
kubectl exec -it demo-dc1-default-sts-0 -n cassandra -c cassandra -- cqlsh
```

## 卸载

卸载：

```bash
make uninstall
```
