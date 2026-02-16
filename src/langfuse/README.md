# Langfuse

## Introduction

Langfuse is an open-source LLM engineering platform for observability, prompt management, and evaluation.

## Installation

To install Langfuse, run:

```bash
make install
```

## Usage

After installation, verify the deployment:

```bash
kubectl get pods -n langfuse
```

To access Langfuse, port-forward the service:

```bash
kubectl port-forward svc/langfuse 3000:3000 -n langfuse
```

Then access at <http://localhost:3000>
