# etcd

## Introduction

etcd is a distributed key-value store that provides a reliable way to store data across a cluster of machines.

## Installation

To install etcd, run:

```bash
make install
```

## Usage

After installation, verify the deployment:

```bash
kubectl get pods -n etcd
```

To connect to etcd, use etcdctl:

```bash
kubectl -n etcd exec -it etcd-0 -- etcdctl get / --prefix
```
