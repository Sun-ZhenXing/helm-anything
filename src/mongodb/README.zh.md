# MongoDB

## 简介

MongoDB 是一个源代码可用的跨平台面向文档的数据库程序。

此 Chart 部署独立的 MongoDB 实例。如需 Operator 管理的 MongoDB 副本集（支持自动扩缩容、升级和备份），请参阅 [mongodb-operator](../mongodb-operator/) 目录。

## 安装

要安装 MongoDB，请运行：

```bash
make install
```

## 使用

安装后，验证部署：

```bash
kubectl get pods -n mongodb
```

要连接到 MongoDB：

```bash
kubectl -n mongodb exec -it mongodb-0 -- mongosh
```
