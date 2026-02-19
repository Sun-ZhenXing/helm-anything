# Kong Gateway

## Introduction

Kong Gateway is a lightweight, fast, and flexible cloud-native API gateway. It is built on NGINX and OpenResty and provides a scalable, high-performance gateway for APIs and microservices.

## Installation

To install Kong Gateway, run:

```bash
make install
```

## Usage

After installation, verify the deployment:

```bash
kubectl get pods -n kong
```

To access Kong Admin API:

```bash
kubectl port-forward svc/kong-admin 8001:8001 -n kong
```

To access Kong Proxy:

```bash
kubectl port-forward svc/kong-proxy 8000:8000 -n kong
```

## Documentation

- [Official Kong Documentation](https://docs.konghq.com/)
- [Helm Chart Source](https://github.com/Kong/charts)
