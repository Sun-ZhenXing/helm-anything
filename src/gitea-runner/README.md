# Gitea Actions Runner

## Introduction

Gitea Actions Runner (act_runner) is the runner for Gitea Actions. This Helm chart deploys the Gitea act-runners alongside a running Gitea instance.

## Installation

To install Gitea Actions Runner, run:

```bash
make install
```

## Configuration

Before installation, you need to configure the runner in values.yaml:

```yaml
statefulset:
  actRunner:
    config: |
      # Your Gitea instance URL and registration token
```

## Usage

After installation, verify the deployment:

```bash
kubectl get pods -n gitea-runner
```

## Documentation

- [Official Gitea Documentation](https://docs.gitea.com/usage/actions/overview)
- [Helm Chart Source](https://gitea.com/gitea/helm-actions)
