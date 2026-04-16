# SigNoz

## 简介

SigNoz 是一款开源可观测性平台和 APM（应用性能监控）工具，帮助开发者监控应用程序、排查问题并深入了解系统性能。SigNoz 是 DataDog 和 NewRelic 的自托管开源替代方案，基于 OpenTelemetry 构建。

主要功能：

- 分布式追踪（Distributed Tracing）
- 指标监控（Metrics Monitoring）
- 日志管理（Log Management）
- 告警与仪表盘

## 前置条件

- Kubernetes >= 1.22
- Helm >= 3.8
- 最低 8 GB 内存（推荐 16 GB）
- 最低 4 核 CPU（推荐 8 核）
- 最低 30 GB 存储空间

## 安装

```bash
make install
```

此命令将在 `platform` 命名空间中部署 SigNoz。

## 使用

安装完成后，验证所有 Pod 正常运行：

```bash
kubectl get pods -n platform
```

访问 SigNoz UI：

```bash
kubectl port-forward svc/signoz-frontend 3301:3301 -n platform
```

然后在浏览器中打开 <http://localhost:3301> 访问 SigNoz 仪表盘。

验证 API 健康状态：

```bash
kubectl port-forward svc/signoz 8080:8080 -n platform
curl http://localhost:8080/api/v1/health
# 预期返回：{"status":"ok"}
```

## 配置

编辑 `values.yaml` 自定义部署。主要配置项：

- `clickhouse.persistence.size` — ClickHouse 数据存储大小（默认：20Gi）
- `frontend.replicaCount` — 前端副本数量
- `otelCollector.replicaCount` — OpenTelemetry Collector 副本数量

查看完整配置选项：

```bash
make values
```

## 文档

- [SigNoz 官方文档](https://signoz.io/docs/)
- [Helm Chart 源码](https://github.com/SigNoz/charts)
- [SigNoz GitHub](https://github.com/SigNoz/signoz)
