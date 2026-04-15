# ECK Operator (Elastic Cloud on Kubernetes)

## Introduction

ECK (Elastic Cloud on Kubernetes) is the official Kubernetes operator from Elastic that orchestrates Elasticsearch, Kibana, APM Server, Enterprise Search, and Beats on Kubernetes.

This chart installs the ECK Operator only. Elasticsearch, Kibana, and other Elastic resources are created through Elasticsearch, Kibana, and other CRDs after the operator is installed.

## Installation

To install the ECK Operator, run:

```bash
make install
```

## Usage

After installation, verify the operator is running:

```bash
kubectl get pods -n elastic-system
```

Check that CRDs are registered:

```bash
kubectl get crd | grep elastic
```

### Create an Elasticsearch Cluster

```yaml
apiVersion: elasticsearch.k8s.elastic.co/v1
kind: Elasticsearch
metadata:
  name: quickstart
spec:
  version: 8.15.0
  nodeSets:
    - name: default
      count: 1
      config:
        node.store.allow_mmap: false
```

Apply the manifest:

```bash
kubectl apply -f elasticsearch.yaml
```

### Create a Kibana Instance

```yaml
apiVersion: kibana.k8s.elastic.co/v1
kind: Kibana
metadata:
  name: quickstart
spec:
  version: 8.15.0
  count: 1
  elasticsearchRef:
    name: quickstart
```

Apply the manifest:

```bash
kubectl apply -f kibana.yaml
```

## Uninstall

To uninstall:

```bash
make uninstall
```

## Documentation

- [ECK Documentation](https://www.elastic.co/guide/en/cloud-on-k8s/current/)
- [ECK GitHub](https://github.com/elastic/cloud-on-k8s)
- [ECK Helm Chart](https://github.com/elastic/cloud-on-k8s/tree/main/deploy/eck-operator)
