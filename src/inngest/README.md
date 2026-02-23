# Inngest

## Introduction

Inngest is an open-source, event-driven job queue and workflow engine. It allows you to build reliable background jobs, scheduled tasks, and event-driven workflows using a declarative approach.

This Helm chart deploys the Inngest server on Kubernetes, enabling you to self-host your event processing infrastructure.

## Installation

To install Inngest, run:

```bash
make install
```

## Usage

After installation:

```bash
# Check if Inngest server is running
kubectl get pods -n inngest

# Port forward to access the dashboard
kubectl port-forward svc/inngest -n inngest 8288:8288
```

Then open <http://localhost:8288> in your browser to access the Inngest dashboard.

## Configuration

The default configuration includes:

- Inngest server with event processing capabilities
- PostgreSQL for data persistence (when enabled)
- Redis for event streaming (when enabled)

## Prerequisites

Inngest requires:

- PostgreSQL database for persistence
- Redis for event streaming (optional but recommended)

Configure these in your values.yaml:

```yaml
postgres:
  host: your-postgres-host
  port: 5432
  database: inngest
  user: inngest
  password: your-password

redis:
  host: your-redis-host
  port: 6379
```

## Event Processing

Inngest processes events from your applications:

```javascript
// Example: Sending events from your application
import { Inngest } from 'inngest'

const inngest = new Inngest({ id: 'my-app' })

await inngest.send({
  name: 'user.signup',
  data: { userId: '123' }
})
```

## Uninstall

To uninstall Inngest:

```bash
make uninstall
```
