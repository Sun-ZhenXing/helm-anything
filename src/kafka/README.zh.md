# Kafka

## 简介

Apache Kafka 是一个开源的分布式事件流平台，用于高性能数据管道、流分析、数据集成和关键任务应用。

## 安装

要安装 Kafka，请运行：

```bash
make install
```

## 使用

安装后，验证部署：

```bash
kubectl get pods -n kafka
```

要生产和消费消息，使用 Kafka 工具：

```bash
kubectl -n kafka exec -it kafka-cluster-kafka-0 -- kafka-console-producer.sh --broker-list kafka-cluster-kafka-bootstrap:9092 --topic test
```
