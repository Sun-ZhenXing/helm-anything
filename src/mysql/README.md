# MySQL InnoDB Cluster

## Introduction

MySQL InnoDB Cluster provides a complete high availability solution for MySQL. This chart deploys a MySQL InnoDB Cluster instance.

The MySQL Operator must be installed first — see the [mysql-operator](../mysql-operator/) directory.

## Installation

To install MySQL InnoDB Cluster, run:

```bash
make install
```

## Usage

After installation, verify the deployment:

```bash
kubectl get pods -n mysql
```

To connect to MySQL:

```bash
kubectl exec -it mysql-0 -n mysql -- mysql -uroot -p
```

## Documentation

- [Official MySQL Documentation](https://dev.mysql.com/doc/)
- [MySQL Operator Documentation](https://dev.mysql.com/doc/mysql-operator/en/)
- [Helm Chart Source](https://github.com/mysql/mysql-operator)
