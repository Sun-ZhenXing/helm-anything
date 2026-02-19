# Grafana

## 简介

Grafana 是一个多平台开源分析和交互式可视化 Web 应用程序。当连接到支持的数据源时，它为 Web 提供图表、图形和警报。

## 安装

要安装 Grafana，请运行：

```bash
make install
```

## 使用

安装完成后，验证部署：

```bash
kubectl get pods -n grafana
```

访问 Grafana：

```bash
kubectl port-forward svc/grafana 3000:3000 -n grafana
```

然后在浏览器中打开 <http://localhost:3000>。

默认凭据：admin/admin

## 文档

- [官方 Grafana 文档](https://grafana.com/docs/)
- [Helm Chart 源码](https://github.com/grafana/helm-charts/tree/main/charts/grafana)
