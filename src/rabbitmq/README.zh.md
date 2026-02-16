# RabbitMQ

## 简介

RabbitMQ 是部署最广泛的开源消息代理。

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
