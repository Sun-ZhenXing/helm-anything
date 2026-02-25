# kgateway

## Introduction

kgateway is a cloud-native API gateway built on Envoy Proxy. It provides a Kubernetes-native way to manage traffic, secure APIs, and observe your services. Formerly known as Gloo Gateway, kgateway offers advanced routing capabilities, traffic management, and extensibility through WebAssembly (Wasm) filters.

## Prerequisites

Before installing kgateway, ensure you have:

1. A Kubernetes cluster (1.25+)
2. `kubectl` installed
3. `helm` installed (3.8+ for OCI support)

## Installation

### Quick Install (includes CRDs)

To install kgateway with all required CRDs:

```bash
make install-all
```

### Step-by-Step Install

1. Install Kubernetes Gateway API CRDs:

    ```bash
    kubectl apply -f https://github.com/kubernetes-sigs/gateway-api/releases/download/v1.4.0/standard-install.yaml
    ```

2. Install kgateway CRDs:

    ```bash
    make install-crds
    ```

3. Install kgateway:

    ```bash
    make install
    ```

## Usage

After installation, verify the deployment:

```bash
# Check if kgateway pods are running
kubectl get pods -n kgateway-system

# Verify GatewayClass is created
kubectl get gatewayclass kgateway

# View kgateway services
kubectl get svc -n kgateway-system
```

## Configuration

The default configuration includes:

- Gateway controller for managing Gateway API resources
- Envoy proxy deployment for traffic handling
- Control plane components for configuration management

## Gateway API

kgateway supports the Kubernetes Gateway API standard. You can create Gateway and HTTPRoute resources to configure routing:

```yaml
apiVersion: gateway.networking.k8s.io/v1
kind: Gateway
metadata:
  name: my-gateway
  namespace: kgateway-system
spec:
  gatewayClassName: kgateway
  listeners:
    - name: http
      protocol: HTTP
      port: 80
```

## Uninstall

To uninstall kgateway:

```bash
make uninstall
```
