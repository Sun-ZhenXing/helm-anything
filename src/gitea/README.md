# Gitea

## Introduction

Gitea is a community managed lightweight code hosting solution written in Go. It is published under the MIT license and is a painless self-hosted Git service.

## Installation

To install Gitea, run:

```bash
make install
```

## Usage

After installation, verify the deployment:

```bash
kubectl get pods -n gitea
```

To access Gitea:

```bash
kubectl port-forward svc/gitea-http 3000:3000 -n gitea
```

Then open <http://localhost:3000> in your browser.

## Documentation

- [Official Gitea Documentation](https://docs.gitea.com/)
- [Helm Chart Source](https://gitea.com/gitea/helm-chart)
