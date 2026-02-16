# Redis

## 简介

Redis 是一个开源 (BSD 许可) 的内存数据结构存储，用作数据库、缓存和消息代理。

## 安装

要安装 Redis，请运行：

```bash
make install
```

## 使用

安装后，验证部署：

```bash
kubectl get pods -n redis
```

要连接到 Redis：

```bash
kubectl -n redis exec -it redis-master-0 -- redis-cli
```
