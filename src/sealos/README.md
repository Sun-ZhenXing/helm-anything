# Sealos

## Introduction

Sealos is a cloud-native Kubernetes distribution and cluster management platform that provides:

- **Kubernetes Lifecycle Management**: Easy installation and management of Kubernetes clusters
- **Application Management**: Deploy and manage applications with a simple command
- **Cloud Shell**: Built-in cloud shell for cluster operations
- **Multi-cluster Management**: Manage multiple Kubernetes clusters from a single interface
- **App Store**: Built-in marketplace for popular applications

## Installation

To install Sealos, run:

```bash
make install
```

This will deploy Sealos in the `sealos` namespace.

## Prerequisites

- Kubernetes v1.27+
- Helm v3.14+
- Cluster-admin privileges

## Usage

After installation, verify the deployment:

```bash
kubectl get pods -n sealos
```

To access the Sealos console:

```bash
kubectl get svc -n sealos
```

If you are using LoadBalancer service type, get the external IP:

```bash
kubectl get svc sealos -n sealos
```

Or use port-forward for local access:

```bash
kubectl port-forward -n sealos svc/sealos 8080:6443
```

Then visit: `http://localhost:8080`

## Configuration

You can customize the installation by modifying the `values.yaml` file:

- `image.repository` and `image.tag`: Change the Sealos image
- `persistence`: Configure persistent storage
- `service.type`: Change service type (ClusterIP, NodePort, LoadBalancer)
- `auth.enableTLS`: Enable TLS for the API endpoint
- `ingress`: Configure ingress for external access

## Uninstall

To uninstall Sealos:

```bash
make uninstall
```

## Documentation

For more information, please refer to the official documentation:

- [Sealos Documentation](https://sealos.io/docs/)
- [Helm Chart Repository](https://github.com/seal-io/helm-charts)
