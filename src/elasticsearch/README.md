# Elasticsearch

## Introduction

Elasticsearch is a distributed, RESTful search and analytics engine capable of addressing a growing number of use cases.

This chart deploys a standalone Elasticsearch instance. For operator-managed Elasticsearch with automated provisioning, scaling, upgrades, and backup, see the [elasticsearch-operator](../elasticsearch-operator/) directory.

## Installation

To install Elasticsearch, run:

```bash
make install
```

## Usage

After installation, verify the deployment:

```bash
kubectl get pods -n elasticsearch
```

To access Elasticsearch, port-forward the service:

```bash
kubectl port-forward svc/elasticsearch-master 9200:9200 -n elasticsearch
```

Then access at <http://localhost:9200>
