# Apache Pulsar

## 简介

Apache Pulsar 是一个云原生分布式消息和流平台，最初由 Yahoo! 创建，现在是 Apache 软件基金会的顶级项目。

## 安装

要安装 Apache Pulsar，请运行：

```bash
make install
```

## 使用

安装完成后，验证部署：

```bash
kubectl get pods -n pulsar
```

检查 Pulsar broker 状态：

```bash
kubectl exec -it pulsar-broker-0 -n pulsar -- bin/pulsar-admin brokers list
```

## 文档

- [官方 Apache Pulsar 文档](https://pulsar.apache.org/docs/)
- [Helm Chart 源码](https://github.com/apache/pulsar-helm-chart)
