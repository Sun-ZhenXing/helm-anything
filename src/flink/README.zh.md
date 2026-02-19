# Apache Flink

## 简介

Apache Flink 是一个框架和分布式处理引擎，用于在无界和有界数据流上进行状态计算。Flink 旨在在所有常见的集群环境中运行，以内存速度和任何规模执行计算。

## 安装

要安装 Apache Flink Kubernetes Operator，请运行：

```bash
make install
```

## 使用

安装完成后，验证部署：

```bash
kubectl get pods -n flink
```

要部署 Flink 作业，请创建 FlinkDeployment 自定义资源。

## 文档

- [官方 Flink 文档](https://nightlies.apache.org/flink/flink-docs-stable/)
- [Flink Kubernetes Operator 文档](https://nightlies.apache.org/flink/flink-kubernetes-operator-docs-stable/)
- [Helm Chart 源码](https://github.com/apache/flink-kubernetes-operator)
