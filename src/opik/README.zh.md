# Opik

## 简介

Opik 是 Comet 开发的开源 LLM 评估框架，帮助开发者跟踪、评估和优化他们的 LLM 应用程序。它为 LLM 调用、提示管理和评估指标提供全面的可观测性。

## 安装

要安装 Opik，请运行：

```bash
make install
```

默认情况下，这将安装最新版本的 Opik。要安装特定版本：

```bash
VERSION=1.0.0 make install
```

## 使用

安装后，验证部署：

```bash
kubectl get pods -n opik
```

要访问 Opik，请端口转发前端服务：

```bash
kubectl port-forward svc/opik-frontend 5173:5173 -n opik
```

然后在 <http://localhost:5173> 访问

## 配置

### 使用外部 ClickHouse

要使用外部 ClickHouse 安装而不是内置的：

```yaml
component:
  backend:
    waitForClickhouse:
      clickhouse:
        host: your-clickhouse-host
        port: 8123
        protocol: http
    env:
      ANALYTICS_DB_MIGRATIONS_URL: 'jdbc:clickhouse://your-clickhouse-host:8123'
      ANALYTICS_DB_HOST: your-clickhouse-host
      ANALYTICS_DB_DATABASE_NAME: opik
      ANALYTICS_DB_MIGRATIONS_USER: opik
      ANALYTICS_DB_USERNAME: opik
      ANALYTICS_DB_MIGRATIONS_PASS: your-password
      ANALYTICS_DB_PASS: your-password

clickhouse:
  enabled: false
```

### 配置 S3 存储

要使用 AWS S3 进行存储：

```yaml
component:
  backend:
    env:
      S3_BUCKET: your-bucket-name
      S3_REGION: us-east-1
      AWS_ACCESS_KEY_ID: your-access-key
      AWS_SECRET_ACCESS_KEY: your-secret-key
```

### 启用 Ingress

要通过 Ingress 暴露 Opik：

```yaml
component:
  frontend:
    ingress:
      enabled: true
      ingressClassName: nginx
      hosts:
        - host: opik.example.com
          paths:
            - path: /
              port: 5173
              pathType: Prefix
```

## 卸载

在卸载之前，请移除 ClickHouse 资源上的 finalizer：

```bash
kubectl patch -n opik chi opik-clickhouse --type json --patch='[ { "op": "remove", "path": "/metadata/finalizers" } ]'
```

然后卸载：

```bash
make uninstall
```

## 版本兼容性

确保你的 Python SDK 版本与 Kubernetes 部署版本匹配：

```bash
pip show opik
```

要更新 Python SDK：

```bash
pip install --upgrade opik==<version>
```

## 文档

- [Opik 文档](https://www.comet.com/docs/opik/)
- [Helm Chart 文档](https://comet-ml.github.io/opik/)
