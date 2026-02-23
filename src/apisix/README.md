# Apache APISIX

## Introduction

Apache APISIX is a dynamic, real-time, high-performance API gateway. It provides rich traffic management features such as load balancing, dynamic upstream, canary release, circuit breaking, authentication, observability, and more.

## Installation

To install APISIX, run:

```bash
make install
```

## Usage

After installation, access APISIX:

```bash
# Port forward to access Admin API
kubectl port-forward svc/apisix-admin -n apisix 9180:9180

# Access Admin API
curl http://localhost:9180/apisix/admin/routes -H 'X-API-Key: edd1c9f034335f136f87ad84b625c8f1'
```

Default Admin API key: `edd1c9f034335f136f87ad84b625c8f1`

## Configuration

The default configuration includes:

- APISIX server with Admin API enabled
- etcd as configuration storage
- Dashboard (if enabled)
- Ingress Controller (if enabled)

## Components

- **APISIX**: Core API gateway server
- **etcd**: Configuration storage backend
- **Dashboard**: Web UI for management (optional)
- **Ingress Controller**: Kubernetes ingress support (optional)

## Creating Routes

Example route configuration:

```bash
curl http://localhost:9180/apisix/admin/routes/1 \
  -H 'X-API-Key: edd1c9f034335f136f87ad84b625c8f1' \
  -X PUT -d '
{
  "uri": "/hello",
  "upstream": {
    "type": "roundrobin",
    "nodes": {
      "127.0.0.1:1980": 1
    }
  }
}'
```

## Uninstall

To uninstall APISIX:

```bash
make uninstall
```
