# Valkey

## 简介

Valkey 是一个开源 (BSD 许可) 的高性能键/值数据存储，支持各种工作负载，如缓存、消息队列，并可以作为主数据库。

## 安装

要安装 Valkey，请运行：

```bash
make install
```

## 使用

安装后，验证部署：

```bash
kubectl get pods -n valkey
```

要连接到 Valkey：

```bash
kubectl -n valkey exec -it valkey-master-0 -- valkey-cli
```
