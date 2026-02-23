# Inngest

## 简介

Inngest 是一个开源的、事件驱动的作业队列和工作流引擎。它允许您使用声明式方法构建可靠的后台作业、计划任务和事件驱动工作流。

此 Helm Chart 在 Kubernetes 上部署 Inngest 服务器，使您能够自托管事件处理基础设施。

## 安装

安装 Inngest：

```bash
make install
```

## 使用

安装完成后：

```bash
# 检查 Inngest 服务器是否运行
kubectl get pods -n inngest

# 端口转发以访问仪表板
kubectl port-forward svc/inngest -n inngest 8288:8288
```

然后在浏览器中打开 <http://localhost:8288> 访问 Inngest 仪表板。

## 配置

默认配置包括：

- 具有事件处理能力的 Inngest 服务器
- PostgreSQL 用于数据持久化（启用时）
- Redis 用于事件流（启用时）

## 先决条件

Inngest 需要：

- PostgreSQL 数据库用于持久化
- Redis 用于事件流（可选但推荐）

在您的 values.yaml 中配置这些：

```yaml
postgres:
  host: your-postgres-host
  port: 5432
  database: inngest
  user: inngest
  password: your-password

redis:
  host: your-redis-host
  port: 6379
```

## 事件处理

Inngest 处理来自您应用程序的事件：

```javascript
// 示例：从您的应用程序发送事件
import { Inngest } from 'inngest'

const inngest = new Inngest({ id: 'my-app' })

await inngest.send({
  name: 'user.signup',
  data: { userId: '123' }
})
```

## 卸载

卸载 Inngest：

```bash
make uninstall
```
