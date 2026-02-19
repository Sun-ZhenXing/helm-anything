# MySQL (Oracle MySQL Operator)

## 简介

MySQL Operator for Kubernetes 在 Kubernetes 中管理 MySQL InnoDB 集群。它由 Oracle 的 MySQL 团队提供。

## 安装

要安装 MySQL Operator 和 MySQL InnoDB 集群，请运行：

```bash
make install
```

## 使用

安装完成后，验证部署：

```bash
kubectl get pods -n mysql
```

连接 MySQL：

```bash
kubectl exec -it mysql-0 -n mysql -- mysql -uroot -p
```

## 文档

- [官方 MySQL 文档](https://dev.mysql.com/doc/)
- [MySQL Operator 文档](https://dev.mysql.com/doc/mysql-operator/en/)
- [Helm Chart 源码](https://github.com/mysql/mysql-operator)
