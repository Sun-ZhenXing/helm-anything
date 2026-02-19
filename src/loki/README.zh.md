# Grafana Loki

## 简介

Grafana Loki 是一个水平可扩展、高可用、多租户的日志聚合系统，受 Prometheus 启发。它旨在非常经济高效且易于操作。

## 安装

要安装 Grafana Loki，请运行：

```bash
make install
```

## 使用

安装完成后，验证部署：

```bash
kubectl get pods -n loki
```

要在 Grafana 中将 Loki 配置为数据源，请使用 URL：
`http://loki.loki.svc.cluster.local:3100`

## 文档

- [官方 Loki 文档](https://grafana.com/docs/loki/latest/)
- [Helm Chart 源码](https://github.com/grafana/helm-charts/tree/main/charts/loki)
