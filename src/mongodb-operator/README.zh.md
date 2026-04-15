# MongoDB Community Operator

## 简介

MongoDB Community Operator 是一个 Kubernetes Operator，用于管理 Kubernetes 上的 MongoDB Community 副本集。它自动化 MongoDB 集群的部署、扩缩容、升级和配置。

此 Chart 仅安装 MongoDB Community Operator。MongoDB 副本集在 Operator 安装后通过 MongoDBCommunity CRD 创建。

## 安装

安装 MongoDB Community Operator：

```bash
make install
```

## 使用

安装完成后，验证 Operator 是否正常运行：

```bash
kubectl get pods -n mongodb-operator
```

检查 CRD 是否已注册：

```bash
kubectl get crd | grep mongodb
```

### 创建 MongoDB 副本集

```yaml
apiVersion: mongodbcommunity.mongodb.com/v1
kind: MongoDBCommunity
metadata:
  name: my-mongodb
spec:
  members: 3
  type: ReplicaSet
  version: 7.0.12
  security:
    authentication:
      modes: [SCRAM]
  users:
    - name: admin
      db: admin
      passwordSecretRef:
        name: my-mongodb-secret
      roles:
        - name: clusterAdmin
          db: admin
        - name: userAdminAnyDatabase
          db: admin
```

应用清单：

```bash
kubectl apply -f mongodb-replicaset.yaml
```

检查副本集状态：

```bash
kubectl get mongodbcommunity -n mongodb
```

## 卸载

卸载：

```bash
make uninstall
```

## 文档

- [MongoDB Community Operator 文档](https://github.com/mongodb/mongodb-kubernetes-operator)
- [MongoDB Kubernetes 文档](https://www.mongodb.com/docs/kubernetes/)
