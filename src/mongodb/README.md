# MongoDB

## Introduction

MongoDB is a source-available cross-platform document-oriented database program.

This chart deploys a standalone MongoDB instance. For operator-managed MongoDB replica sets with automated scaling, upgrades, and backup, see the [mongodb-operator](../mongodb-operator/) directory.

## Installation

To install MongoDB, run:

```bash
make install
```

## Usage

After installation, verify the deployment:

```bash
kubectl get pods -n mongodb
```

To connect to MongoDB:

```bash
kubectl -n mongodb exec -it mongodb-0 -- mongosh
```
