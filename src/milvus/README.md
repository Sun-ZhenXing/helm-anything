# Milvus

## Introduction

Milvus is an open-source vector database built to power embedding similarity search and AI applications.

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
