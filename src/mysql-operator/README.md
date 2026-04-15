# MySQL Operator

## Introduction

MySQL Operator for Kubernetes manages MySQL InnoDB Cluster setups inside a Kubernetes cluster. It is developed and maintained by the MySQL team at Oracle.

This chart installs the MySQL Operator only. To deploy a MySQL InnoDB Cluster, see the [mysql](../mysql/) directory.

## Installation

To install the MySQL Operator, run:

```bash
make install
```

## Usage

After installation, verify the operator is running:

```bash
kubectl get pods -n mysql-operator
```

Check that CRDs are registered:

```bash
kubectl get crd | grep mysql
```

## Uninstall

To uninstall:

```bash
make uninstall
```

## Documentation

- [MySQL Operator Documentation](https://dev.mysql.com/doc/mysql-operator/en/)
- [MySQL Operator GitHub](https://github.com/mysql/mysql-operator)
