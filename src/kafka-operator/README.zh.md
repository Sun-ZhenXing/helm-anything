# Strimzi Kafka Operator

## 简介

Strimzi 提供了在 Kubernetes 上运行 Apache Kafka 的方式。Strimzi Kafka Operator 通过自定义资源定义（CRD）管理 Kafka 集群、主题和用户。

此 Chart 仅安装 Strimzi Kafka Operator。Kafka 集群在 Operator 安装后通过 Kafka CRD 创建——没有独立的 Kafka 集群 Helm Chart。`kafka-cluster.yaml` 中提供了示例集群定义。

## 安装

安装 Strimzi Kafka Operator：

```bash
make install
```

## 使用

安装完成后，验证 Operator 是否正常运行：

```bash
kubectl get pods -n strimzi-operator
```

使用示例 CRD 创建 Kafka 集群：

```bash
kubectl apply -f kafka-cluster.yaml -n kafka
```

检查集群状态：

```bash
kubectl get kafka -n kafka
```

## 卸载

卸载：

```bash
make uninstall
```

## 文档

- [Strimzi 文档](https://strimzi.io/docs/)
- [Strimzi GitHub](https://github.com/strimzi/strimzi-kafka-operator)
