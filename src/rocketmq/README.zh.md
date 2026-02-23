# Apache RocketMQ

## 简介

Apache RocketMQ 是一个分布式消息和流平台，具有低延迟、高性能和可靠性、万亿级容量和灵活的扩展性。

此 Helm Chart 在 Kubernetes 上部署 Apache RocketMQ，包括 NameServer、Broker 和 Console 组件。

## 安装

安装 RocketMQ：

```bash
make install
```

## 使用

安装完成后：

```bash
# 检查 RocketMQ 组件是否运行
kubectl get pods -n rocketmq

# 端口转发以访问 NameServer
kubectl port-forward svc/rocketmq-nameserver -n rocketmq 9876:9876

# 端口转发以访问 Console（如果启用）
kubectl port-forward svc/rocketmq-console -n rocketmq 8080:8080
```

## 配置

默认配置包括：

- 2 个 NameServer 副本用于高可用
- 1 个 Broker master 和 1 个 slave (2m-2s sync_flush)
- 用于管理 UI 的 Console
- 消息数据的持久存储

## 组件

- **NameServer**: 服务发现和路由
- **Broker**: 消息存储和传递
- **Console**: 管理和监控的 Web UI

## 客户端连接

```java
Properties props = new Properties();
props.setProperty("namesrvAddr", "rocketmq-nameserver.rocketmq:9876");
DefaultMQProducer producer = new DefaultMQProducer("TestProducer", props);
```

## 存储

为 broker 配置持久存储：

```yaml
broker:
  storage:
    size: 50Gi
    class: standard
```

## 卸载

卸载 RocketMQ：

```bash
make uninstall
```
