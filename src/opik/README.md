# Opik

## Introduction

Opik is an open-source LLM evaluation framework by Comet that helps developers track, evaluate, and optimize their LLM applications. It provides comprehensive observability for LLM calls, prompt management, and evaluation metrics.

## Installation

To install Opik, run:

```bash
make install
```

By default, this will install the latest version of Opik. To install a specific version:

```bash
VERSION=1.0.0 make install
```

## Usage

After installation, verify the deployment:

```bash
kubectl get pods -n opik
```

To access Opik, port-forward the frontend service:

```bash
kubectl port-forward svc/opik-frontend 5173:5173 -n opik
```

Then access at <http://localhost:5173>

## Configuration

### Using External ClickHouse

To use an external ClickHouse installation instead of the built-in one:

```yaml
component:
  backend:
    waitForClickhouse:
      clickhouse:
        host: your-clickhouse-host
        port: 8123
        protocol: http
    env:
      ANALYTICS_DB_MIGRATIONS_URL: 'jdbc:clickhouse://your-clickhouse-host:8123'
      ANALYTICS_DB_HOST: your-clickhouse-host
      ANALYTICS_DB_DATABASE_NAME: opik
      ANALYTICS_DB_MIGRATIONS_USER: opik
      ANALYTICS_DB_USERNAME: opik
      ANALYTICS_DB_MIGRATIONS_PASS: your-password
      ANALYTICS_DB_PASS: your-password

clickhouse:
  enabled: false
```

### Configuring S3 Storage

To use AWS S3 for storage:

```yaml
component:
  backend:
    env:
      S3_BUCKET: your-bucket-name
      S3_REGION: us-east-1
      AWS_ACCESS_KEY_ID: your-access-key
      AWS_SECRET_ACCESS_KEY: your-secret-key
```

### Enabling Ingress

To expose Opik via Ingress:

```yaml
component:
  frontend:
    ingress:
      enabled: true
      ingressClassName: nginx
      hosts:
        - host: opik.example.com
          paths:
            - path: /
              port: 5173
              pathType: Prefix
```

## Uninstallation

Before uninstalling, remove the finalizer on the ClickHouse resource:

```bash
kubectl patch -n opik chi opik-clickhouse --type json --patch='[ { "op": "remove", "path": "/metadata/finalizers" } ]'
```

Then uninstall:

```bash
make uninstall
```

## Version Compatibility

Ensure your Python SDK version matches your Kubernetes deployment version:

```bash
pip show opik
```

To update the Python SDK:

```bash
pip install --upgrade opik==<version>
```

## Documentation

- [Opik Documentation](https://www.comet.com/docs/opik/)
- [Helm Chart Documentation](https://comet-ml.github.io/opik/)
