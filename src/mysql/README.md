# MySQL (Oracle MySQL Operator)

## Introduction

MySQL Operator for Kubernetes manages MySQL InnoDB Cluster in Kubernetes. It is brought to you by the MySQL team at Oracle.

## Installation

To install MySQL Operator and MySQL InnoDB Cluster, run:

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
