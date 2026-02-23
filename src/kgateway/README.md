# kgateway

## Introduction

kgateway is a cloud-native API gateway built on Envoy Proxy. It provides a Kubernetes-native way to manage traffic, secure APIs, and observe your services. Formerly known as Gloo Gateway, kgateway offers advanced routing capabilities, traffic management, and extensibility through WebAssembly (Wasm) filters.

## Installation

To install kgateway, run:

```bash
make install
```

## Usage

After installation, you can configure kgateway using Kubernetes Gateway API resources:

```bash
# Check if kgateway pods are running
kubectl get pods -n kgateway-system

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
