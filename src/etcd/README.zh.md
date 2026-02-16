# etcd

## 简介

etcd 是一个分布式键值存储，提供了一种可靠的方式来跨集群机器存储数据。

## 安装

要安装 etcd，请运行：

```bash
make install
```

## 使用

安装后，验证部署：

```bash
kubectl get pods -n etcd
```

要连接到 etcd，使用 etcdctl：

```bash
kubectl -n etcd exec -it etcd-0 -- etcdctl get / --prefix
```
