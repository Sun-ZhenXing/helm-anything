# SigNoz OTel Gateway

## 简介

SigNoz OTel Gateway 是 SigNoz 的独立 OpenTelemetry 网关组件，作为集中式遥测数据接入端点，接收来自应用或其他采集器的 Traces/Metrics/Logs，并将其转发到 SigNoz 后端（`signoz/signoz`）。

适用场景：

- 需要统一的公网 OTLP 接入点（HTTP/gRPC）
- 多集群遥测数据聚合
- Heroku 日志引流或 JSON HTTP 日志接入
- 将公网接收层与 SigNoz 后端分离部署

> **前置条件：** 需先安装 [SigNoz](../signoz/)。

## 安装

```bash
make install
```

将在 `platform` 命名空间部署网关。安装前，请在 `values.yaml` 中更新导出器端点，指向 SigNoz 的 OTel Collector 服务：

```yaml
config:
  exporters:
    otlp:
      endpoint: signoz-otel-collector.platform.svc.cluster.local:4317
```

## 使用

安装完成后，验证 Pod 运行状态：

```bash
kubectl get pods -n platform -l app.kubernetes.io/name=signoz-otel-gateway
```

通过 OTLP HTTP 发送测试 Trace：

```bash
kubectl port-forward svc/signoz-otel-gateway 4318:4318 -n platform
curl -X POST http://localhost:4318/v1/traces \
  -H "Content-Type: application/json" \
  -d '{"resourceSpans":[]}'
```

### Ingress 端点

| 协议        | 域名                       | 路径                                    |
| ----------- | -------------------------- | --------------------------------------- |
| HTTP (OTLP) | `otel-gateway.example.com` | `/v1/traces`, `/v1/metrics`, `/v1/logs` |
| HTTP (日志) | `otel-gateway.example.com` | `/logs/json`, `/logs/heroku`            |
| gRPC (OTLP) | `otel-gateway.example.com` | gRPC 服务路径                           |

请将 `otel-gateway.example.com` 替换为 `values.yaml` 中的实际域名。

## 文档

- [SigNoz OTel Gateway Chart](https://github.com/SigNoz/charts/tree/main/charts/signoz-otel-gateway)
- [SigNoz 官方文档](https://signoz.io/docs/)
