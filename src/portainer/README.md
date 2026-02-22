# Portainer

## Introduction

Portainer is a lightweight management UI that allows you to easily manage your Docker and Kubernetes environments. It provides a simple and intuitive interface for deploying and managing containerized applications, as well as managing resources such as networks, volumes, and images.

## Installation

To install Portainer, run:

```bash
make install
```

## Usage

After installation, access Portainer:

### Using NodePort (default)

Portainer will be available on port `30777` for HTTP and `30779` for HTTPS.

```bash
# Port forward to access web UI
kubectl port-forward svc/portainer -n portainer 30777:9000 30779:9443
```

Then open `https://localhost:30779` in your browser.

### Using LoadBalancer

If you configured `service.type=LoadBalancer`, get the external IP:

```bash
kubectl get svc -n portainer
```

Then access Portainer at `https://<EXTERNAL-IP>:9443`.

### Using Ingress

If you configured ingress, access Portainer at your configured hostname.

## Initial Setup

1. Open Portainer in your browser
2. Create an admin user on the initial setup page
3. Select "Kubernetes" as the environment type
4. Start managing your cluster

## Configuration

The default configuration uses NodePort service type. You can customize:

- `service.type`: Change to `LoadBalancer` or `ClusterIP` with ingress
- `tls.force`: Enable/disable TLS
- `persistence.storageClass`: Specify a storage class
- `resources`: Adjust CPU/memory limits

## Features

- **Container Management**: Deploy, manage, and monitor containers
- **Image Management**: Pull, push, and manage container images
- **Network Management**: Create and manage Docker networks
- **Volume Management**: Manage persistent storage
- **Multi-Environment**: Manage multiple Kubernetes clusters
- **RBAC**: Role-based access control for teams

## Customization

Edit `values.yaml` to configure:

- Ingress settings
- Resource limits
- Persistence options
- TLS configuration
- Feature flags
