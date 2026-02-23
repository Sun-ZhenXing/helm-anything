# Logstash

## Introduction

Logstash is an open-source data processing pipeline that ingests data from multiple sources, transforms it, and then sends it to your favorite "stash" (like Elasticsearch). It is part of the Elastic Stack (ELK Stack) and is commonly used for log aggregation and analysis.

This Helm chart deploys Logstash on Kubernetes for processing and forwarding logs.

## Installation

To install Logstash, run:

```bash
make install
```

## Usage

After installation:

```bash
# Check if Logstash is running
kubectl get pods -n logstash

# View Logstash logs
kubectl logs -f -n logstash -l app=logstash
```

## Configuration

The default configuration includes:

- Logstash pipeline with basic input/output configuration
- Persistent volume for data persistence
- Resource limits for stable operation

## Pipeline Configuration

Configure your Logstash pipeline in `values.yaml`:

```yaml
logstashPipeline:
  logstash.conf: |
    input {
      beats {
        port => 5044
      }
    }
    filter {
      # Add your filters here
    }
    output {
      elasticsearch {
        hosts => ["http://elasticsearch:9200"]
        index => "%{[@metadata][beat]}-%{[@metadata][version]}-%{+YYYY.MM.dd}"
      }
    }
```

## Inputs and Outputs

Common input plugins:

- `beats`: Receive data from Beats shippers
- `tcp`/`udp`: Receive data over network
- `http`: Receive data via HTTP
- `kafka`: Consume from Kafka topics

Common output plugins:

- `elasticsearch`: Send to Elasticsearch
- `kafka`: Produce to Kafka topics
- `s3`: Write to AWS S3
- `stdout`: Output to console (for debugging)

## Persistence

Enable persistent storage for queue data:

```yaml
persistence:
  enabled: true
  size: 10Gi
```

## Uninstall

To uninstall Logstash:

```bash
make uninstall
```
