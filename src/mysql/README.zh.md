# MySQL InnoDB 集群

## 简介

MySQL InnoDB Cluster 为 MySQL 提供完整的高可用解决方案。此 Chart 部署 MySQL InnoDB Cluster 实例。

必须先安装 MySQL Operator — 请参阅 [mysql-operator](../mysql-operator/) 目录。

## 安装

要安装 MySQL InnoDB 集群，请运行：

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
