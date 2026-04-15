# MongoDB Community Operator

## Introduction

MongoDB Community Operator is a Kubernetes operator that manages MongoDB Community replica sets on Kubernetes. It automates deployment, scaling, upgrades, and configuration of MongoDB clusters.

This chart installs the MongoDB Community Operator only. MongoDB replica sets are created through MongoDBCommunity CRDs after the operator is installed.

## Installation

To install the MongoDB Community Operator, run:

```bash
make install
```

## Usage

After installation, verify the operator is running:

```bash
kubectl get pods -n mongodb-operator
```

Check that CRDs are registered:

```bash
kubectl get crd | grep mongodb
```

### Create a MongoDB Replica Set

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

Apply the manifest:

```bash
kubectl apply -f mongodb-replicaset.yaml
```

Check the replica set status:

```bash
kubectl get mongodbcommunity -n mongodb
```

## Uninstall

To uninstall:

```bash
make uninstall
```

## Documentation

- [MongoDB Community Operator Documentation](https://github.com/mongodb/mongodb-kubernetes-operator)
- [MongoDB Kubernetes Documentation](https://www.mongodb.com/docs/kubernetes/)
