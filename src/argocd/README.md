# ArgoCD

## Introduction

ArgoCD is a declarative, GitOps continuous delivery tool for Kubernetes. It follows the GitOps pattern of using Git repositories as the source of truth for defining the desired application state.

## Installation

To install ArgoCD, run:

```bash
make install
```

Default credentials:

- Username: `admin`
- Password: `admin`

## Usage

After installation, access ArgoCD:

```bash
# Port forward to access UI
kubectl port-forward svc/argocd-server -n argocd 8080:443

# Get admin password
kubectl get secret argocd-initial-admin-secret -n argocd -o jsonpath="{.data.password}" | base64 -d
```

Then open <https://localhost:8080> in your browser.

## Configuration

The default configuration includes:

- Single Redis instance
- Single controller replica
- Single repo server
- Dex enabled for SSO

For production, consider enabling HA mode with multiple replicas.
