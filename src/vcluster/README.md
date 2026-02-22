# vCluster

## Introduction

vCluster (Virtual Cluster) is an open-source tool that allows you to create and manage fully functional Kubernetes clusters within a namespace of another Kubernetes cluster. It provides strong isolation, reduced operational overhead, and better resource utilization compared to separate physical clusters.

## Features

- **Lightweight**: Run isolated Kubernetes clusters without the overhead of separate control planes
- **Strong Isolation**: Each vCluster has its own API server and control plane
- **Cost Effective**: Share infrastructure while maintaining isolation
- **RBAC & Network Policies**: Full support for native Kubernetes security features
- **Persistent Storage**: Support for persistent volumes and storage classes
- **Multi-Tenancy**: Ideal for development, testing, and CI/CD pipelines

## Prerequisites

- A working Kubernetes cluster (host cluster)
- kubectl configured to access the host cluster
- Default StorageClass configured (for persistent workloads)

## Installation

To install vCluster, run:

```bash
make install
```

## Usage

### Create a Virtual Cluster

After installing vCluster, create a virtual cluster:

```bash
# Create a virtual cluster named 'my-vcluster'
vcluster create my-vcluster

# Or specify a namespace
vcluster create my-vcluster -n vcluster
```

### Connect to a Virtual Cluster

```bash
# Connect to the virtual cluster (updates kubeconfig)
vcluster connect my-vcluster

# Or get the kubeconfig without switching
vcluster connect my-vcluster --update-current=false
```

### List Virtual Clusters

```bash
vcluster list
```

### Delete a Virtual Cluster

```bash
vcluster delete my-vcluster
```

## vCluster CLI Installation

Install the vCluster CLI tool:

```bash
# macOS
curl -L -o vcluster "https://github.com/loft-sh/vcluster/releases/latest/download/vcluster-darwin-amd64" && chmod +x vcluster && sudo mv vcluster /usr/local/bin

# Linux
curl -L -o vcluster "https://github.com/loft-sh/vcluster/releases/latest/download/vcluster-linux-amd64" && chmod +x vcluster && sudo mv vcluster /usr/local/bin

# Windows (PowerShell)
md -Force "$Env:APPDATA\vcluster"; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.SecurityProtocolType]'Tls,Tls11,Tls12'; Invoke-WebRequest -URI "https://github.com/loft-sh/vcluster/releases/latest/download/vcluster-windows-amd64.exe" -outfile "$Env:APPDATA\vcluster\vcluster.exe"; $env:Path += ";" + $Env:APPDATA + "\vcluster"; [Environment]::SetEnvironmentVariable("Path", $env:Path, [EnvironmentVariableTarget]::User);
```

## Storage

vCluster supports:

- **Ephemeral Storage**: Data is lost when the vCluster is deleted
- **Persistent Storage**: Use PVCs for persistent workloads
- **HostPath**: Direct access to host node storage (not recommended for production)

## Networking

vCluster creates an isolated network within the host cluster:

- Each vCluster has its own ClusterIP services
- Ingress can be configured to route traffic to vCluster services
- Network policies can be used for additional isolation

## Configuration

Edit `values.yaml` to configure:

- vCluster version (Kubernetes version)
- Resource limits
- Storage backend
- Synced resources
- Isolation settings

## vCluster Platform (Optional)

For additional features like UI, multi-cluster management, and advanced networking:

```bash
helm upgrade vcluster-platform vcluster-platform \
  --install \
  --repo https://charts.loft.sh \
  --namespace vcluster-platform \
  --create-namespace
```

## Important Notes

1. vCluster creates lightweight, isolated Kubernetes clusters
2. The host cluster must have sufficient resources
3. Consider using vCluster Platform for enterprise features
4. Persistent storage requires proper StorageClass configuration
5. Network policies can enhance isolation between vClusters
