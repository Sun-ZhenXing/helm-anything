# Rancher

## Introduction

Rancher is a complete container management platform that makes it easy to run Kubernetes everywhere. It solves three major operational challenges: provisioning Kubernetes clusters on any infrastructure, unifying disparate Kubernetes clusters under centralized authentication and access control, and workload management across clusters.

## Prerequisites

- A Kubernetes cluster (RKE2, K3s, or any certified Kubernetes distribution)
- cert-manager installed (v1.8.0 or higher recommended)
- Default StorageClass configured

## Installation

To install Rancher, run:

```bash
make install
```

## Usage

After installation, access Rancher:

### Get the Rancher URL

```bash
# For LoadBalancer service type
kubectl get svc -n cattle-system

# For NodePort service type
kubectl get svc -n cattle-system
```

### Get the Bootstrap Password

```bash
kubectl get secret --namespace cattle-system bootstrap-secret -o go-template='{{.data.bootstrapPassword|base64decode}}{{ "\n" }}'
```

### Access the UI

1. Open the Rancher URL in your browser
2. Log in with username `admin` and the bootstrap password
3. Follow the setup wizard to configure Rancher

## Configuration

### SSL/TLS Configuration

Rancher supports multiple SSL/TLS configurations:

- **rancher**: Use Rancher-generated CA certificate (default)
- **letsEncrypt**: Use Let's Encrypt for automatic certificate management
- **secret**: Use your own TLS certificate

### Service Type

- **LoadBalancer**: Recommended for production (requires cloud provider or MetalLB)
- **NodePort**: For local/development environments
- **ClusterIP**: For ingress controller configuration

## Features

- **Multi-Cluster Management**: Manage multiple Kubernetes clusters from a single interface
- **User Management**: Centralized authentication and RBAC
- **App Catalog**: Deploy applications from Helm charts
- **Monitoring**: Built-in monitoring with Prometheus and Grafana
- **Logging**: Centralized logging with Fluentd
- **Istio Service Mesh**: Deploy and manage Istio
- **CI/CD Pipelines**: Integrated CI/CD with Fleet

## Customization

Edit `values.yaml` to configure:

- `hostname`: The FQDN for Rancher
- `ingress.tls.source`: SSL certificate source
- `replicas`: Number of Rancher replicas
- `resources`: CPU/memory limits
- `auditLog`: Audit logging configuration

## Important Notes

1. Rancher should only be installed on a supported Kubernetes cluster
2. The bootstrap password is generated automatically on first install
3. For production, use a proper SSL certificate and hostname
4. Consider using Rancher Backup operator for disaster recovery
