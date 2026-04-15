# ClickHouse

## Introduction

ClickHouse is an open-source column-oriented database management system for online analytical processing (OLAP).

This chart deploys ClickHouse using the Altinity Helm chart. For operator-managed ClickHouse clusters with automated deployment, scaling, and configuration, see the [clickhouse-operator](../clickhouse-operator/) directory.

## Installation

To install ClickHouse, run:

```bash
make install
```

## Usage

After installation, verify the deployment:

```bash
kubectl get pods -n clickhouse
```

To connect to ClickHouse:

```bash
kubectl -n clickhouse exec -it chi-clickhouse-clickhouse-0-0-0 -- clickhouse-client
```

Or use port forwarding:

```bash
kubectl -n clickhouse port-forward services/clickhouse 9000:9000
```

**Note**: Please change the default password in production environments.
