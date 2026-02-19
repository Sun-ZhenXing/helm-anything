# Nginx

## Introduction

Nginx is a high-performance HTTP server and reverse proxy, known for its stability, rich feature set, simple configuration, and low resource consumption.

## Installation

To install Nginx, run:

```bash
make install
```

## Usage

After installation, verify the deployment:

```bash
kubectl get pods -n nginx
```

To access Nginx, port-forward the service:

```bash
kubectl port-forward svc/nginx 8080:80 -n nginx
```

Then access at <http://localhost:8080>

## Configuration

You can customize the Nginx configuration by editing `values.yaml`:

- `config`: Custom nginx.conf content
- `serverConfig`: Custom server block configuration
- `staticSiteConfigmap`: Use an existing ConfigMap with static site content
- `ingress`: Configure ingress for external access

## Documentation

For more information, see:

- [Nginx Official Website](https://www.nginx.com)
- [Nginx Documentation](https://nginx.org/en/docs/)
