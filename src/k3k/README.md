# K3k

## Introduction

K3k (Kubernetes in Kubernetes) is a tool that empowers you to create and manage isolated K3s clusters within your existing Kubernetes environment. It enables efficient multi-tenancy, streamlined experimentation, and robust resource isolation, minimizing infrastructure costs by allowing you to run multiple lightweight Kubernetes clusters on the same physical host.

## Features

- **Shared Mode**: Optimized resource utilization by sharing underlying resources
- **Virtual Mode**: Complete isolation with dedicated K3s server pods
- **Rancher Integration**: Seamlessly integrates with Rancher for simplified cluster management
- **Resource Isolation**: Define resource limits and quotas for each embedded cluster
- **Lightweight**: Leverages the lightweight nature of K3s for fast cluster provisioning

## Prerequisites

- A working Kubernetes cluster (host cluster)
- Storage provider configured (or use ephemeral/static storage)
- kubectl configured to access the host cluster

## Installation

To install K3k controller, run:

```bash
make install
```

## Usage

### Install k3kcli (Optional)

Download and install the k3k CLI tool:

```bash
# Linux amd64
wget -qO k3kcli https://github.com/rancher/k3k/releases/latest/download/k3kcli-linux-amd64
chmod +x k3kcli
sudo mv k3kcli /usr/local/bin
```

### Create a K3k Cluster

Using k3kcli:

```bash
k3kcli cluster create my-cluster
```

Using kubectl (create a Cluster CR):

```bash
cat <<EOF | kubectl apply -f -
apiVersion: k3k.io/v1alpha1
kind: Cluster
metadata:
  name: my-cluster
  namespace: k3k
spec:
  mode: shared
  servers: 1
  agents: 0
  version: v1.28.4+k3s1
EOF
```

### Get Cluster Kubeconfig

```bash
# Using k3kcli
k3kcli kubeconfig generate --name my-cluster --namespace k3k

# Or directly from secret
kubectl get secret my-cluster-kubeconfig -n k3k -o jsonpath='{.data.value}' | base64 -d > my-cluster.yaml
```

### Delete a K3k Cluster

```bash
# Using k3kcli
k3kcli cluster delete my-cluster

# Or using kubectl
kubectl delete cluster my-cluster -n k3k
```

## Cluster Modes

### Shared Mode

- Server components run as pods in the host cluster
- Efficient resource sharing
- Suitable for development and testing

### Virtual Mode

- Each cluster has dedicated K3s server pods
- Complete network and resource isolation
- Suitable for multi-tenant environments

## Configuration

Edit `values.yaml` to configure:

- Controller resources
- Feature gates
- Image versions
- RBAC settings

## Important Notes

1. K3k creates virtual Kubernetes clusters within your existing cluster
2. The host cluster must have sufficient resources for virtual clusters
3. Storage classes must be available for persistent workloads
4. Consider network policies for isolation between virtual clusters
