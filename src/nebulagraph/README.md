# NebulaGraph Cluster

## Introduction

NebulaGraph is an open-source distributed graph database built for super large-scale graphs with milliseconds of latency. It delivers high performance, scalability, and availability for storing and processing graph data.

This Helm chart deploys a NebulaGraph cluster on Kubernetes.

The NebulaGraph Operator must be installed first — see the [nebulagraph-operator](../nebulagraph-operator/) directory.

## Installation

To install NebulaGraph, run:

```bash
make install
```

## Usage

After installation:

```bash
# Check if NebulaGraph cluster is running
kubectl get pods -n nebula

# Access Graphd service
kubectl port-forward svc/nebula-graphd -n nebula 9669:9669
```

## Configuration

The default configuration includes:

- NebulaGraph cluster with 3 graphd, 3 metad, and 3 storaged nodes
- Persistent storage for data
- Default port configurations

## Components

- **Graphd**: Query engine for graph processing
- **Metad**: Metadata management
- **Storaged**: Storage engine for graph data

## Connecting to NebulaGraph

Use Nebula Console to connect:

```bash
# Install nebula-console
# Connect to the cluster
./nebula-console -addr 127.0.0.1 -port 9669 -u root -p nebula
```

## Graph Data Model

NebulaGraph uses:

- **Vertices**: Represent entities
- **Edges**: Represent relationships
- **Tags**: Define vertex types
- **Edge Types**: Define relationship types

## Uninstall

To uninstall NebulaGraph:

```bash
make uninstall
```
