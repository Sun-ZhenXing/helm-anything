# Logstash

## 简介

Logstash 是一个开源数据处理管道，可从多个来源摄取数据，对其进行转换，然后将其发送到您喜欢的"存储"（如 Elasticsearch）。它是 Elastic Stack（ELK Stack）的一部分，通常用于日志聚合和分析。

此 Helm Chart 在 Kubernetes 上部署 Logstash，用于处理和转发日志。

## 安装

安装 Logstash：

```bash
make install
```

## 使用

安装完成后：

```bash
# 检查 Logstash 是否运行
kubectl get pods -n logstash

# 查看 Logstash 日志
kubectl logs -f -n logstash -l app=logstash
```

## 配置

默认配置包括：

- 具有基本输入/输出配置的 Logstash 管道
- 用于数据持久化的持久卷
- 稳定操作的资源限制

## 管道配置

在 `values.yaml` 中配置您的 Logstash 管道：

```yaml
logstashPipeline:
  logstash.conf: |
    input {
      beats {
        port => 5044
      }
    }
    filter {
      # 在此处添加您的过滤器
    }
    output {
      elasticsearch {
        hosts => ["http://elasticsearch:9200"]
        index => "%{[@metadata][beat]}-%{[@metadata][version]}-%{+YYYY.MM.dd}"
      }
    }
```

## 输入和输出

常用输入插件：

- `beats`: 从 Beats 接收数据
- `tcp`/`udp`: 通过网络接收数据
- `http`: 通过 HTTP 接收数据
- `kafka`: 从 Kafka 主题消费

常用输出插件：

- `elasticsearch`: 发送到 Elasticsearch
- `kafka`: 生产到 Kafka 主题
- `s3`: 写入 AWS S3
- `stdout`: 输出到控制台（用于调试）

## 持久化

为队列数据启用持久存储：

```yaml
persistence:
  enabled: true
  size: 10Gi
```

## 卸载

卸载 Logstash：

```bash
make uninstall
```
