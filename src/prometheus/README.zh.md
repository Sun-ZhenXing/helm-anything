# Prometheus (kube-prometheus-stack)

## 简介

kube-prometheus-stack 收集了 Kubernetes 清单、Grafana 仪表板和 Prometheus 规则，以及文档和脚本，使用 Prometheus Operator 提供易于操作的端到端 Kubernetes 集群监控。

## 安装

要安装 Prometheus，请运行：

```bash
make install
```

## 使用

安装完成后，验证部署：

```bash
kubectl get pods -n prometheus
```

访问 Prometheus UI：

```bash
kubectl port-forward svc/prometheus-kube-prometheus-prometheus 9090:9090 -n prometheus
```

然后在浏览器中打开 <http://localhost:9090>。

## 文档

- [官方 Prometheus 文档](https://prometheus.io/docs/)
- [Helm Chart 源码](https://github.com/prometheus-community/helm-charts)
