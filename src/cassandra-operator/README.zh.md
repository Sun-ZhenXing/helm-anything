# K8ssandra Operator

## 简介

K8ssandra Operator 是一个 Kubernetes Operator，用于管理基于 K8ssandra 的 Apache Cassandra 集群的生命周期。它负责集群的配置、扩展、修复调度（Reaper）、备份管理（Medusa）和监控。

此 Chart 仅安装 K8ssandra Operator。要使用 Helm 部署 K8ssandra/Cassandra 集群，请参阅 [cassandra](../cassandra/) 目录。也可以通过 K8ssandraCluster CRD 创建 Cassandra 集群——示例集群定义见 `k8ssandra-cluster.yaml`。

## 安装

安装 K8ssandra Operator：

```bash
make install
```

## 使用

安装完成后，验证 Operator 是否正常运行：

```bash
kubectl get pods -n k8ssandra-operator
```

使用示例 CRD 创建 Cassandra 集群：

```bash
kubectl apply -f k8ssandra-cluster.yaml -n cassandra
```

检查集群状态：

```bash
kubectl get k8ssandraclusters -n cassandra
```

集群就绪后，可使用 cqlsh 连接：

```bash
kubectl exec -it -n cassandra cassandra-cluster-dc1-default-sts-0 -- cqlsh
```

检查 CRD 是否已注册：

```bash
kubectl get crd | grep k8ssandra
```

## 卸载

卸载：

```bash
make uninstall
```

## 文档

- [K8ssandra 文档](https://docs.k8ssandra.io/)
- [K8ssandra Operator GitHub](https://github.com/k8ssandra/k8ssandra-operator)
