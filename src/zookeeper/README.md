# ZooKeeper

## Introduction

Apache ZooKeeper is an open-source server which enables highly reliable distributed coordination.

## Installation

To install ZooKeeper, run:

```bash
make install
```

## Usage

After installation, verify the deployment:

```bash
kubectl get pods -n zookeeper
```

To connect to ZooKeeper:

```bash
kubectl -n zookeeper exec -it zookeeper-0 -- zkCli.sh
```
