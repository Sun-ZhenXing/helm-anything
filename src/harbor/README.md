# Harbor

## Introduction

Harbor is an open-source trusted cloud-native registry project that stores, signs, and scans content. Harbor extends the open-source Docker Distribution by adding the functionalities usually required by users such as security, identity, and management.

## Installation

To install Harbor, run:

```bash
make install
```

## Usage

After installation, verify the deployment:

```bash
kubectl get pods -n harbor
```

To access Harbor Portal:

```bash
kubectl port-forward svc/harbor-portal 8080:80 -n harbor
```

Then open <http://localhost:8080> in your browser.

Default credentials: admin/Harbor12345

## Documentation

- [Official Harbor Documentation](https://goharbor.io/docs/)
- [Helm Chart Source](https://github.com/goharbor/harbor-helm)
