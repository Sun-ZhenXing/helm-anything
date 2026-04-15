# NebulaGraph 集群

## 简介

NebulaGraph 是一个开源的分布式图数据库，专为超大规模图数据而设计，具有毫秒级延迟。它为存储和处理图数据提供高性能、可扩展性和可用性。

此 Helm Chart 用于在 Kubernetes 上部署 NebulaGraph 集群。

必须先安装 NebulaGraph Operator — 请参阅 [nebulagraph-operator](../nebulagraph-operator/) 目录。

## 安装

安装 NebulaGraph：

```bash
make install
```

## 使用

安装完成后：

```bash
# 检查 NebulaGraph 集群是否运行
kubectl get pods -n nebula

# 访问 Graphd 服务
kubectl port-forward svc/nebula-graphd -n nebula 9669:9669
```

## 配置

默认配置包括：

- NebulaGraph 集群，包含 3 个 graphd、3 个 metad 和 3 个 storaged 节点
- 数据持久化存储
- 默认端口配置

## 组件

- **Graphd**: 图处理查询引擎
- **Metad**: 元数据管理
- **Storaged**: 图数据存储引擎

## 连接 NebulaGraph

使用 Nebula Console 连接：

```bash
# 安装 nebula-console
# 连接到集群
./nebula-console -addr 127.0.0.1 -port 9669 -u root -p nebula
```

## 图数据模型

NebulaGraph 使用：

- **顶点**: 表示实体
- **边**: 表示关系
- **标签**: 定义顶点类型
- **边类型**: 定义关系类型

## 卸载

卸载 NebulaGraph：

```bash
make uninstall
```
