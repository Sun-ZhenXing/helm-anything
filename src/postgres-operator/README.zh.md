# CloudNativePG Operator

## 简介

CloudNativePG 是一个 PostgreSQL Kubernetes Operator，通过 Kubernetes 原生 CRD 管理完整的 PostgreSQL 生命周期——配置、复制、故障转移、备份和监控。

此 Chart 仅安装 CloudNativePG Operator。PostgreSQL 集群在 Operator 安装后通过 Cluster CRD 创建。

## 安装

安装 CloudNativePG Operator：

```bash
make install
```

## 使用

安装完成后，验证 Operator 是否正常运行：

```bash
kubectl get pods -n cnpg-system
```

检查 CRD 是否已注册：

```bash
kubectl get crd | grep cnpg
```

### 创建 PostgreSQL 集群

```yaml
apiVersion: postgresql.cnpg.io/v1
kind: Cluster
metadata:
  name: postgres-cluster
spec:
  instances: 3
  storage:
    size: 1Gi
  postgresql:
    parameters:
      max_connections: '200'
```

应用清单：

```bash
kubectl apply -f postgres-cluster.yaml
```

检查集群状态：

```bash
kubectl get cluster -n postgres
```

连接 PostgreSQL：

```bash
kubectl exec -it postgres-cluster-1 -n postgres -- psql
```

## 卸载

卸载：

```bash
make uninstall
```

## 文档

- [CloudNativePG 文档](https://cloudnative-pg.io/documentation/)
- [CloudNativePG GitHub](https://github.com/cloudnative-pg/cloudnative-pg)
