# PostgreSQL

## Introduction

PostgreSQL is a powerful, open source object-relational database system with over 35 years of active development.

This chart deploys a standalone PostgreSQL instance. For operator-managed PostgreSQL with automated high availability, failover, backup, and monitoring, see the [postgres-operator](../postgres-operator/) directory.

## Installation

To install PostgreSQL, run:

```bash
make install
```

## Usage

After installation, verify the deployment:

```bash
kubectl get pods -n postgres
```

To connect to PostgreSQL:

```bash
kubectl -n postgres exec -it postgres-0 -- psql -U postgres
```
