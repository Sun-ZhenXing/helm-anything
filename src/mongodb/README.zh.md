# MongoDB

## 简介

MongoDB 是一个源代码可用的跨平台面向文档的数据库程序。

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
