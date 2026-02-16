# Redis

## Introduction

Redis is an open source (BSD licensed), in-memory data structure store, used as a database, cache, and message broker.

## Installation

To install Redis, run:

```bash
make install
```

## Usage

After installation, verify the deployment:

```bash
kubectl get pods -n redis
```

To connect to Redis:

```bash
kubectl -n redis exec -it redis-master-0 -- redis-cli
```
