# MySQL Operator

## 简介

MySQL Operator for Kubernetes 在 Kubernetes 集群中管理 MySQL InnoDB Cluster。它由 Oracle 的 MySQL 团队开发和维护。

此 Chart 仅安装 MySQL Operator。要部署 MySQL InnoDB 集群，请参阅 [mysql](../mysql/) 目录。

## 安装

安装 MySQL Operator：

```bash
make install
```

## 使用

安装完成后，验证 Operator 是否正常运行：

```bash
kubectl get pods -n mysql-operator
```

检查 CRD 是否已注册：

```bash
kubectl get crd | grep mysql
```

## 卸载

卸载：

```bash
make uninstall
```

## 文档

- [MySQL Operator 文档](https://dev.mysql.com/doc/mysql-operator/en/)
- [MySQL Operator GitHub](https://github.com/mysql/mysql-operator)
