# Rainbond

## Introduction

Rainbond is a cloud-native application management platform that enables easy deployment, management, and scaling of applications on Kubernetes. It provides a complete PaaS (Platform as a Service) solution with:

- **Application Management**: Easy deployment and lifecycle management of applications
- **Service Mesh**: Built-in service discovery and traffic management
- **Multi-tenant**: Support for multiple teams and users
- **CI/CD Integration**: Automated build and deployment pipelines
- **Marketplace**: Pre-built application templates and components

## Installation

To install Rainbond, run:

```bash
make install
```

This will deploy Rainbond in the `rbd-system` namespace.

## Usage

After installation, verify the deployment:

```bash
kubectl get pods -n rbd-system
```

To access the Rainbond console, you need to get the gateway IP:

```bash
kubectl get pod -n rbd-system -l name=rbd-gateway -o wide
```

Then visit: `http://<GATEWAY_NODE_IP>:7070`

Or if you have configured an ingress:

```bash
kubectl get ingress -n rbd-system
```

## Configuration

You can customize the installation by modifying the `values.yaml` file:

- `Cluster.gatewayIngressIPs`: Set the gateway ingress IPs
- `Cluster.nodesForGateway`: Configure nodes for gateway
- `pvc.storageClassName`: Set the storage class for PVCs
- `resources`: Configure resource limits and requests

## Uninstall

To uninstall Rainbond:

```bash
make uninstall
```

## Documentation

For more information, please refer to the official documentation:

- [Rainbond Documentation](https://www.rainbond.com/docs/)
- [Helm Chart Repository](https://github.com/goodrain/rainbond-chart)
