# Nexus Repository Manager

## Introduction

Nexus Repository Manager is a powerful artifact repository manager that supports various formats including Maven, npm, NuGet, Docker, and more. It acts as a central hub for storing and managing software artifacts.

## Installation

To install Nexus, run:

```bash
make install
```

## Usage

After installation, access Nexus:

```bash
# Port forward to access Nexus
kubectl port-forward svc/nexus-repository-manager -n nexus 8081:8081
```

Then open <http://localhost:8081> in your browser.

Default credentials:

- Username: `admin`
- Password: Retrieve from pod

```bash
# Get admin password
kubectl exec -it deployment/nexus-repository-manager -n nexus -- cat /nexus-data/admin.password
```

## Configuration

The default configuration includes:

- 100Gi persistent storage for artifacts
- 4Gi memory limit
- Single replica deployment
- JVM heap size: 2g

## Repository Types

Nexus supports various repository formats:

- **Maven** (Java artifacts)
- **npm** (Node.js packages)
- **NuGet** (.NET packages)
- **Docker** (Container images)
- **PyPI** (Python packages)
- **Raw** (Generic files)
- **Yum/APT** (Linux packages)

## Docker Registry

To enable Docker registry support:

1. Edit `values.yaml` and set `nexus.docker.enabled: true`
2. Configure registries with ports
3. Expose via NodePort or Ingress

## Backup

Consider enabling scheduled backups:

1. Configure `backup.enabled: true`
2. Set up backup schedule and storage
