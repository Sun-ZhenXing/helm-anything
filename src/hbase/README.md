# Apache HBase

## Introduction

Apache HBase is an open-source, distributed, versioned, non-relational database modeled after Google's Bigtable. It provides Bigtable-like capabilities on top of Hadoop and HDFS.

## Installation

To install Apache HBase, run:

```bash
make install
```

## Usage

After installation, verify the deployment:

```bash
kubectl get pods -n hbase
```

To access HBase shell:

```bash
kubectl exec -it hbase-master-0 -n hbase -- hbase shell
```

## Documentation

- [Official HBase Documentation](https://hbase.apache.org/book.html)
- [Helm Chart Source](https://github.com/apecloud/kubeblocks-addons/tree/main/addons/hbase)
