# Dify

## Introduction

Dify is an open-source LLM (Large Language Model) application development platform. It helps developers build generative AI applications more easily by combining AI workflow, RAG pipeline, agent capabilities, model management, observability features, and more.

This Helm chart deploys Dify on Kubernetes, including:

- API Server
- Web Frontend
- Worker for background tasks
- Weaviate for vector database
- Redis for caching
- PostgreSQL for data persistence

## Installation

To install Dify, run:

```bash
make install
```

## Prerequisites

Dify requires the following components:

- PostgreSQL 14+ (or use built-in)
- Redis 6+ (or use built-in)
- Weaviate vector database (or use built-in)

## Usage

After installation:

```bash
# Check if Dify pods are running
kubectl get pods -n dify

# Port forward to access Dify
kubectl port-forward svc/dify-web -n dify 3000:3000
kubectl port-forward svc/dify-api -n dify 5001:5001
```

Then open <http://localhost:3000> in your browser.

## Configuration

The default configuration includes:

- Dify API server with default settings
- Web frontend
- Background worker
- Built-in Weaviate vector database
- Built-in Redis cache
- Built-in PostgreSQL database

## Environment Variables

Configure Dify using environment variables in values.yaml:

```yaml
api:
  env:
    - name: APP_API_URL
      value: 'http://dify-api:5001'
    - name: SECRET_KEY
      value: your-secret-key
    - name: CONSOLE_API_URL
      value: 'http://dify-api:5001'
    - name: CONSOLE_WEB_URL
      value: 'http://dify-web:3000'
```

## External Dependencies

To use external PostgreSQL/Redis:

```yaml
postgresql:
  enabled: false
externalPostgresql:
  host: your-postgres-host
  port: 5432
  database: dify
  username: dify
  password: your-password

redis:
  enabled: false
externalRedis:
  host: your-redis-host
  port: 6379
  password: your-password
```

## Uninstall

To uninstall Dify:

```bash
make uninstall
```
