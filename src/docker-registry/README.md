# Docker Registry

## Introduction

Docker Registry is a stateless, highly scalable server-side application that stores and lets you distribute Docker images. It is open-source, licensed under the Apache-2.0 license.

This Helm chart deploys a private Docker Registry on Kubernetes, allowing you to store and manage your container images within your own infrastructure.

## Installation

To install Docker Registry, run:

```bash
make install
```

## Usage

After installation, you can push and pull images from the registry:

```bash
# Port forward to access registry locally
kubectl port-forward svc/registry -n registry 5000:5000

# Tag an image for your private registry
docker tag my-image localhost:5000/my-image

# Push to your private registry
docker push localhost:5000/my-image

# Pull from your private registry
docker pull localhost:5000/my-image
```

## Configuration

The default configuration includes:

- In-memory storage (for testing only)
- No authentication
- Service type: ClusterIP

## Storage Options

For production use, configure persistent storage:

```yaml
persistence:
  enabled: true
  size: 10Gi
  storageClass: standard
```

## Authentication

Enable basic authentication:

```yaml
secrets:
  htpasswd: |
    admin:$2y$05$...
```

## TLS

Enable TLS for secure communication:

```yaml
tlsSecretName: registry-tls
```

## Uninstall

To uninstall Docker Registry:

```bash
make uninstall
```
