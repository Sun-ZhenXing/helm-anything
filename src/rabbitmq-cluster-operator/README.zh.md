# RabbitMQ Cluster Operator

## 简介

RabbitMQ Cluster Operator 是一个 Kubernetes Operator，用于自动化 Kubernetes 上 RabbitMQ 集群的部署和管理。

如需部署独立的 RabbitMQ（不使用 Operator），请参阅 [rabbitmq](../rabbitmq/) 目录。

## 安装

要安装 RabbitMQ Cluster Operator，请运行：

```bash
make install
```

## 使用

安装后，验证部署：

```bash
kubectl get pods -n rabbitmq-operator
```

要创建 RabbitMQ 集群，请应用 RabbitmqCluster 自定义资源：

```yaml
apiVersion: rabbitmq.com/v1beta1
kind: RabbitmqCluster
metadata:
  name: my-rabbitmq
  namespace: default
spec:
  replicas: 3
  resources:
    requests:
      cpu: 500m
      memory: 1Gi
    limits:
      cpu: 1
      memory: 2Gi
```

要访问 RabbitMQ 管理 UI，请端口转发服务：

```bash
kubectl port-forward svc/my-rabbitmq 15672:15672 -n default
```

然后在 <http://localhost:15672> 访问

## 文档

更多信息请参阅：

- [RabbitMQ Cluster Operator GitHub](https://github.com/rabbitmq/cluster-operator)
- [RabbitMQ 文档](https://www.rabbitmq.com/kubernetes/operator/operator-overview.html)
