# Valkey

## Introduction

Valkey is an open-source (BSD licensed) high-performance key/value datastore that supports a variety of workloads such as caching, message queues, and can act as a primary database.

## Installation

To install Valkey, run:

```bash
make install
```

## Usage

After installation, verify the deployment:

```bash
kubectl get pods -n valkey
```

To connect to Valkey:

```bash
kubectl -n valkey exec -it valkey-master-0 -- valkey-cli
```
