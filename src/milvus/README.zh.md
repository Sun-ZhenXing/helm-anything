# Milvus

## 简介

Milvus 是一个开源的向量数据库，专为嵌入相似性搜索和 AI 应用而构建。

此 Chart 使用官方 Helm chart 部署 Milvus。如需 Operator 管理的 Milvus 集群（自动化部署包含 etcd、Pulsar、MinIO 在内的完整栈），请参阅 [milvus-operator](../milvus-operator/) 目录。

## 安装

要安装 Milvus，请运行：

```bash
make install
```

## 使用

安装后，验证部署：

```bash
kubectl get pods -n milvus
```

要连接到 Milvus，使用 Python SDK 或 REST API。端口转发服务：

```bash
kubectl port-forward svc/milvus 19530:19530 -n milvus
```

然后使用客户端连接。
