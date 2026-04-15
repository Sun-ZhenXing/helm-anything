# Apache Cassandra (K8ssandra)

## 简介

Apache Cassandra 是一个免费、开源的分布式宽列存储 NoSQL 数据库管理系统，旨在处理大量跨多台商用服务器的数据。此 Chart 通过 K8ssandra 部署 Cassandra 集群，由 K8ssandra Operator 管理。

必须先安装 K8ssandra Operator — 请参阅 [cassandra-operator](../cassandra-operator/) 目录。

## 安装

要安装 Apache Cassandra，请运行：

```bash
make install
```

## 使用

安装完成后，验证部署：

```bash
kubectl get pods -n cassandra
```

检查 Cassandra 集群状态：

```bash
kubectl get k8ssandraclusters -n cassandra
```

使用 cqlsh 连接 Cassandra：

```bash
kubectl exec -it -n cassandra cassandra-cluster-dc1-default-sts-0 -- cqlsh
```

## 卸载

卸载 Cassandra：

```bash
make uninstall
```

## 文档

- [K8ssandra 文档](https://docs.k8ssandra.io/)
- [Apache Cassandra 文档](https://cassandra.apache.org/doc/latest/)
- [K8ssandra Helm Chart](https://github.com/k8ssandra/k8ssandra-helm)
