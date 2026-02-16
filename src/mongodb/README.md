# MongoDB

## Introduction

MongoDB is a source-available cross-platform document-oriented database program.

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
