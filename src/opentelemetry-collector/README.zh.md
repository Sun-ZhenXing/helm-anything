# OpenTelemetry Collector

## 简介

OpenTelemetry Collector 是一个供应商无关的实现，用于接收、处理和导出遥测数据。

## 安装

要安装 OpenTelemetry Collector，请运行：

```bash
make install
```

## 使用

安装后，验证部署：

```bash
kubectl get pods -n opentelemetry-collector
```

收集器将根据其配置接收遥测数据并导出到配置的后端。
