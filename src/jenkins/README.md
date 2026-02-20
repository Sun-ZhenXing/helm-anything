# Jenkins

## Introduction

Jenkins is an open-source automation server that enables developers to build, test, and deploy their software reliably. It supports thousands of plugins for various CI/CD pipelines.

## Installation

To install Jenkins, run:

```bash
make install
```

## Usage

After installation, access Jenkins:

```bash
# Port forward to access Jenkins
kubectl port-forward svc/jenkins -n jenkins 8080:8080

# Get admin password
kubectl get secret jenkins -n jenkins -o jsonpath="{.data.jenkins-admin-password}" | base64 -d
```

Then open <http://localhost:8080> and complete the setup wizard.

## Configuration

The default configuration includes:

- Pre-installed plugins for Kubernetes, Git, Pipeline, and Blue Ocean
- 1 controller replica with 2Gi memory limit
- 1Gi persistent volume for build data
- Configuration as Code (CasC) enabled

## Installed Plugins

- kubernetes - Kubernetes plugin for dynamic agents
- workflow-aggregator - Pipeline plugin suite
- git - Git integration
- configuration-as-code - CasC support
- blue-ocean - Modern UI
- docker-workflow - Docker pipeline support
- pipeline-stage-view - Pipeline visualization

## Customization

To customize Jenkins:

1. Edit `values.yaml` to add more plugins
2. Configure CasC scripts for pre-configured jobs
3. Adjust resource limits based on your workload
