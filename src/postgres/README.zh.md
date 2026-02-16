# PostgreSQL

## 简介

PostgreSQL 是一个强大的开源对象关系数据库系统，已有超过 35 年的活跃开发。

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
