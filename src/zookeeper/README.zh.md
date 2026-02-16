# ZooKeeper

## 简介

Apache ZooKeeper 是一个开源服务器，支持高度可靠的分布式协调。

## 安装

要安装 ZooKeeper，请运行：

```bash
make install
```

## 使用

安装后，验证部署：

```bash
kubectl get pods -n zookeeper
```

要连接到 ZooKeeper：

```bash
kubectl -n zookeeper exec -it zookeeper-0 -- zkCli.sh
```
