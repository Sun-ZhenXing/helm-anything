# Milvus

## Introduction

Milvus is an open-source vector database built to power embedding similarity search and AI applications.

This chart deploys Milvus using the official Helm chart. For operator-managed Milvus clusters with automated stack deployment (including etcd, Pulsar, MinIO), see the [milvus-operator](../milvus-operator/) directory.

## Installation

To install Milvus, run:

```bash
make install
```

## Usage

After installation, verify the deployment:

```bash
kubectl get pods -n milvus
```

To connect to Milvus, use the Python SDK or REST API. Port-forward the service:

```bash
kubectl port-forward svc/milvus 19530:19530 -n milvus
```

Then connect using the client.
