# Apache Airflow

## 简介

Apache Airflow 是一个以编程方式编写、调度和监控工作流的平台。它使用有向无环图 (DAG) 来管理工作流编排。

## 安装

安装 Airflow：

```bash
make install
```

## 使用

安装完成后，访问 Airflow：

```bash
# 端口转发以访问 Web UI
kubectl port-forward svc/airflow-webserver -n airflow 8080:8080
```

然后在浏览器中打开 <http://localhost:8080>。

默认凭据：

- 用户名：`admin`
- 密码：`admin`

## 配置

默认配置包括：

- CeleryExecutor 用于分布式任务执行
- 内置 PostgreSQL 作为元数据库
- 内置 Redis 作为 Celery 代理
- Webserver、Scheduler、Workers 和 Triggerer 均为单副本
- 10Gi 日志持久化存储

## 组件

- **Webserver**: 提供 UI 和 API
- **Scheduler**: 调度和触发任务
- **Workers**: 执行任务 (CeleryExecutor)
- **Triggerer**: 运行基于事件的触发器
- **Flower**: Celery 监控工具

## 添加 DAG

添加您的 DAG：

1. 启用 `dags.gitSync` 并配置 Git 仓库，或
2. 挂载包含 DAG 文件的持久卷，或
3. 使用 Airflow UI 上传 DAG 文件（不推荐用于生产环境）

## 自定义

- 编辑 `values.yaml` 配置连接、变量和池
- 增加 `workers.replicas` 扩展 Workers
- 启用 ingress 用于外部访问
