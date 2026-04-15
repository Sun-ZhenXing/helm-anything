# Milvus Operator

## 简介

Milvus Operator 是一个 Kubernetes Operator，用于自动化 Milvus 向量数据库集群在 Kubernetes 上的部署和管理。它提供了简便的方案来部署和管理完整的 Milvus 服务栈，包括 etcd、Pulsar 和 MinIO，支持可扩展和高可用的部署。

此 Chart 仅安装 Milvus Operator。Milvus 集群在 Operator 安装后通过 MilvusCluster CRD 创建。

## 安装

安装 Milvus Operator：

```bash
make install
```

## 使用

安装完成后，验证 Operator 是否正常运行：

```bash
kubectl get pods -n milvus-operator
```

检查 CRD 是否已注册：

```bash
kubectl get crd | grep milvus
```

### 创建 Milvus 集群

```yaml
apiVersion: milvus.io/v1beta1
kind: MilvusCluster
metadata:
  name: my-milvus
  namespace: milvus
spec:
  components:
    image: milvusdb/milvus:v2.4.17
    proxy:
      replicas: 1
    rootCoord:
      replicas: 1
    dataCoord:
      replicas: 1
    indexCoord:
      replicas: 1
    queryCoord:
      replicas: 1
    dataNode:
      replicas: 1
    indexNode:
      replicas: 1
    queryNode:
      replicas: 1
  config:
    milvus:
      log:
        level: info
```

应用清单：

```bash
kubectl apply -f milvus-cluster.yaml
```

检查集群状态：

```bash
kubectl get milvuscluster -n milvus
```

## 卸载

卸载：

```bash
make uninstall
```

## 文档

- [Milvus Operator 文档](https://github.com/zilliztech/milvus-operator)
- [Milvus 文档](https://milvus.io/docs/)
