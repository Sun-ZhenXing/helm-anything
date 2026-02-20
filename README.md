# Helm Anything

A repository of pre-configured Helm command templates for deploying various services quickly and consistently on Kubernetes using a unified `make install` interface.

## Overview

This project provides a collection of Helm chart configurations for popular services, enabling users to deploy them with minimal effort. The architecture follows the "Template Method" pattern, where a base Makefile in `src/_template` defines the core deployment logic, and individual service directories inherit and override specific variables.

## Supported Services

The following services are currently supported:

### Databases & Storage

- ClickHouse
- DuckDB
- Elasticsearch
- etcd
- HBase
- Kafka
- MariaDB
- Milvus
- MinIO
- MongoDB
- MySQL
- Neo4j
- PostgreSQL
- Pulsar
- RabbitMQ
- RabbitMQ Cluster Operator
- Redis
- Valkey
- Vault
- ZooKeeper

### DevOps & CI/CD

- ArgoCD
- Gitea
- Gitea Runner
- GitLab
- GitLab Runner
- Harbor
- Jenkins
- Nexus

### Data & Analytics

- Airflow
- Apache Flink

### Observability & Monitoring

- Grafana
- Kibana
- Langfuse
- Loki
- OpenTelemetry Collector
- Phoenix
- Prometheus

### Streaming & API Gateway

- Apache Pulsar
- Kong
- Nginx

### AI & ML

- LiteLLM
- MLflow
- Open WebUI

### Identity & Service Mesh

- Keycloak
- Nacos

Each service has its own directory under `src/`, containing:

- `Makefile`: Service-specific configuration
- `values.yaml`: Helm chart values overrides
- `README.md`: English documentation
- `README.zh.md`: Chinese documentation

## Quick Start

1. Clone the repository:

   ```bash
   git clone https://github.com/your-repo/helm-anything.git
   cd helm-anything
   ```

2. Navigate to the desired service directory:

   ```bash
   cd src/redis
   ```

3. Install the service:

   ```bash
   make install
   ```

4. Verify the deployment:

   ```bash
   kubectl get pods -n <service-namespace>
   ```

## Prerequisites

- Kubernetes cluster
- Helm 3.x
- kubectl configured to access your cluster

## Contributing

Please refer to the [contribution guidelines](.github/instructions/base.instructions.md) for details on adding new services or modifying existing ones.

## License

This project is licensed under the MIT License - see the LICENSE file for details.
