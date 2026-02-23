# Dify

## 简介

Dify 是一个开源的 LLM（大语言模型）应用开发平台。它通过结合 AI 工作流、RAG 管道、Agent 能力、模型管理、可观测性功能等，帮助开发者更轻松地构建生成式 AI 应用。

此 Helm Chart 在 Kubernetes 上部署 Dify，包括：

- API 服务器
- Web 前端
- 后台任务 Worker
- Weaviate 向量数据库
- Redis 缓存
- PostgreSQL 数据持久化

## 安装

安装 Dify：

```bash
make install
```

## 先决条件

Dify 需要以下组件：

- PostgreSQL 14+（或使用内置的）
- Redis 6+（或使用内置的）
- Weaviate 向量数据库（或使用内置的）

## 使用

安装完成后：

```bash
# 检查 Dify pod 是否运行
kubectl get pods -n dify

# 端口转发以访问 Dify
kubectl port-forward svc/dify-web -n dify 3000:3000
kubectl port-forward svc/dify-api -n dify 5001:5001
```

然后在浏览器中打开 <http://localhost:3000>。

## 配置

默认配置包括：

- 默认设置的 Dify API 服务器
- Web 前端
- 后台 worker
- 内置 Weaviate 向量数据库
- 内置 Redis 缓存
- 内置 PostgreSQL 数据库

## 环境变量

在 values.yaml 中使用环境变量配置 Dify：

```yaml
api:
  env:
    - name: APP_API_URL
      value: 'http://dify-api:5001'
    - name: SECRET_KEY
      value: your-secret-key
    - name: CONSOLE_API_URL
      value: 'http://dify-api:5001'
    - name: CONSOLE_WEB_URL
      value: 'http://dify-web:3000'
```

## 外部依赖

使用外部 PostgreSQL/Redis：

```yaml
postgresql:
  enabled: false
externalPostgresql:
  host: your-postgres-host
  port: 5432
  database: dify
  username: dify
  password: your-password

redis:
  enabled: false
externalRedis:
  host: your-redis-host
  port: 6379
  password: your-password
```

## 卸载

卸载 Dify：

```bash
make uninstall
```
