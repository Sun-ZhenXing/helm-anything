# PostgreSQL

## 简介

PostgreSQL 是一个功能强大的开源对象关系型数据库系统，拥有超过 35 年的活跃开发历史。

此 Chart 部署独立的 PostgreSQL 实例。如需 Operator 管理的 PostgreSQL（支持自动高可用、故障转移、备份和监控），请参阅 [postgres-operator](../postgres-operator/) 目录。

## 安装

要安装 PostgreSQL，请运行：

```bash
make install
```

## 使用

安装后，验证部署：

```bash
kubectl get pods -n postgres
```

要连接到 PostgreSQL：

```bash
kubectl -n postgres exec -it postgres-0 -- psql -U postgres
```
