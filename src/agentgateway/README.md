# agentgateway

## Introduction

agentgateway is a cloud-native API gateway designed for AI workloads. It provides a Kubernetes-native way to manage traffic, secure APIs, and observe your AI services. Built on the Kubernetes Gateway API, agentgateway enables seamless integration with AI agents and services.

## Prerequisites

Before installing agentgateway, ensure you have:

1. A Kubernetes cluster (1.25+)
2. `kubectl` installed
3. `helm` installed (3.8+ for OCI support)

## Installation

### Quick Install (includes CRDs)

To install agentgateway with all required CRDs:

```bash
make install-all
```

### Step-by-Step Install

1. Install Gateway API CRDs:

```bash
kubectl apply -f https://github.com/kubernetes-sigs/gateway-api/releases/download/v1.4.0/standard-install.yaml
```

1. Install agentgateway CRDs:

```bash
make install-crds
```

1. Install agentgateway:

```bash
make install
```

## Usage

After installation, verify the deployment:

```bash
# Check if agentgateway pods are running
kubectl get pods -n agentgateway-system

# Verify GatewayClass is created
kubectl get gatewayclass agentgateway

# View agentgateway services
kubectl get svc -n agentgateway-system
```

## Configuration

The default configuration includes:

- Gateway controller for managing Gateway API resources
- Control plane components for configuration management
- Support for AI workload routing

You can customize the installation by modifying `values.yaml` before running `make install`.

## Gateway API

agentgateway supports the Kubernetes Gateway API standard. You can create Gateway and HTTPRoute resources to configure routing:

```yaml
apiVersion: gateway.networking.k8s.io/v1
kind: Gateway
metadata:
  name: my-gateway
  namespace: agentgateway-system
spec:
  gatewayClassName: agentgateway
  listeners:
    - name: http
      protocol: HTTP
      port: 80
```

## Uninstall

To uninstall agentgateway:

```bash
make uninstall
```

## Documentation

For more information, visit the [official documentation](https://agentgateway.dev/docs/kubernetes/latest/).
