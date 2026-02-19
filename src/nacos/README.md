# Nacos

## Introduction

Nacos is an easy-to-use platform designed for dynamic service discovery, configuration management, and service management. It helps you build cloud-native applications and microservices more quickly and easily.

## Installation

To install Nacos, run:

```bash
make install
```

## Usage

After installation, verify the deployment:

```bash
kubectl get pods -n nacos
```

To access Nacos Console:

```bash
kubectl port-forward svc/nacos 8848:8848 -n nacos
```

Then open <http://localhost:8848/nacos> in your browser.

Default credentials: nacos/nacos

## Documentation

- [Official Nacos Documentation](https://nacos.io/en-us/docs/what-is-nacos.html)
- [Helm Chart Source](https://github.com/nacos-group/nacos-k8s)
