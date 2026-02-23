# Verdaccio

## Introduction

Verdaccio is a lightweight private npm proxy registry built in Node.js. It allows you to have a local npm registry with zero configuration, and provides features such as:

- Private package hosting
- Proxy to npmjs.org (caching)
- Local storage for offline access
- Plugin support for authentication and storage

This Helm chart deploys Verdaccio on Kubernetes for hosting private npm packages.

## Installation

To install Verdaccio, run:

```bash
make install
```

## Usage

After installation:

```bash
# Port forward to access Verdaccio
kubectl port-forward svc/verdaccio -n verdaccio 4873:4873
```

Then configure npm to use your private registry:

```bash
# Set registry
npm set registry http://localhost:4873

# Login (if authentication is enabled)
npm adduser --registry http://localhost:4873

# Publish a package
npm publish

# Install packages
npm install
```

## Configuration

The default configuration includes:

- Anonymous access for reading packages
- Proxy to npmjs.org for packages not found locally
- Local file system storage
- Basic web interface enabled

## Storage

Enable persistent storage for production:

```yaml
persistence:
  enabled: true
  size: 10Gi
```

## Authentication

Enable authentication in config.yaml:

```yaml
auth:
  htpasswd:
    file: /verdaccio/conf/htpasswd
    max_users: 1000
```

## Uplink Configuration

Configure multiple uplinks for package proxying:

```yaml
uplinks:
  npmjs:
    url: https://registry.npmjs.org/
  yarn:
    url: https://registry.yarnpkg.com
```

## Package Access

Configure package access permissions:

```yaml
packages:
  '@mycompany/*':
    access: $authenticated
    publish: $authenticated
```

## Uninstall

To uninstall Verdaccio:

```bash
make uninstall
```
