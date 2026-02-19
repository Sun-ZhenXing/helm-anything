# MariaDB

## Introduction

MariaDB is a high-performance, open-source relational database server that is a drop-in replacement for MySQL. It supports both single-node and Galera Cluster deployments.

## Installation

To install MariaDB, run:

```bash
make install
```

## Usage

After installation, verify the deployment:

```bash
kubectl get pods -n mariadb
```

To connect to MariaDB from within the cluster:

```bash
kubectl exec -it -n mariadb deploy/mariadb -- mysql -u root -p
```

To access MariaDB from outside the cluster, port-forward the service:

```bash
kubectl port-forward svc/mariadb 3306:3306 -n mariadb
```

Then connect using:

```bash
mysql -h 127.0.0.1 -P 3306 -u root -p
```

## Configuration

You can customize the MariaDB configuration by editing `values.yaml`:

- `auth`: Configure database authentication (root password, custom user)
- `galera`: Enable Galera Cluster mode for high availability
- `persistence`: Configure PVC storage settings
- `metrics`: Enable Prometheus metrics exporter

## Galera Cluster

To enable Galera Cluster mode, set:

```yaml
galera:
  enabled: true
  replicaCount: 3
```

## Documentation

For more information, see:

- [MariaDB Official Website](https://mariadb.org)
- [MariaDB Documentation](https://mariadb.com/kb/en/documentation/)
