# MinIO

## Introduction

MinIO is a high-performance, S3 compatible object store.

## Installation

To install MinIO, run:

```bash
make install
```

## Usage

After installation, verify the deployment:

```bash
kubectl get pods -n minio
```

To access MinIO, port-forward the service:

```bash
kubectl port-forward svc/minio 9000:9000 -n minio
```

Then access the console at <http://localhost:9000>
