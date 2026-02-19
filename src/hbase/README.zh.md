# Apache HBase

## 简介

Apache HBase 是一个开源的、分布式的、版本化的、非关系型数据库，模仿 Google's Bigtable。它在 Hadoop 和 HDFS 之上提供类似 Bigtable 的功能。

## 安装

要安装 Apache HBase，请运行：

```bash
make install
```

## 使用

安装完成后，验证部署：

```bash
kubectl get pods -n hbase
```

访问 HBase shell：

```bash
kubectl exec -it hbase-master-0 -n hbase -- hbase shell
```

## 文档

- [官方 HBase 文档](https://hbase.apache.org/book.html)
- [Helm Chart 源码](https://github.com/apecloud/kubeblocks-addons/tree/main/addons/hbase)
