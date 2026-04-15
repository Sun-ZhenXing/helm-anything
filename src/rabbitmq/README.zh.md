# RabbitMQ

## 简介

RabbitMQ 是部署最广泛的开源消息代理。

此 Chart 使用 CloudPirates Helm chart 部署独立的 RabbitMQ 实例。如需 Operator 管理的 RabbitMQ 集群（支持自动扩缩容和自愈等高级功能），请参阅 [rabbitmq-cluster-operator](../rabbitmq-cluster-operator/) 目录。

## 安装

要安装 RabbitMQ，请运行：

```bash
make install
```

## 使用

安装后，验证部署：

```bash
kubectl get pods -n rabbitmq
```

要访问 RabbitMQ 管理 UI，请端口转发服务：

```bash
kubectl port-forward svc/rabbitmq 15672:15672 -n rabbitmq
```

然后在 <http://localhost:15672> 访问
