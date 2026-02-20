# Vault

## Introduction

HashiCorp Vault is an identity-based secrets and encryption management system. It provides secure secret storage, dynamic secrets, data encryption, and identity-based access.

## Installation

To install Vault, run:

```bash
make install
```

## Usage

After installation, initialize and unseal Vault:

```bash
# Port forward to access Vault
kubectl port-forward svc/vault -n vault 8200:8200

# Initialize Vault (save the unseal keys!)
vault operator init

# Unseal Vault (run 3 times with different keys)
vault operator unseal

# Login with root token
vault login
```

Access the UI at <http://localhost:8200>.

## Configuration

The default configuration runs Vault in standalone mode with:

- File storage backend
- 10Gi data storage
- 10Gi audit storage
- Kubernetes auth method enabled

For production, consider using:

- Integrated Raft storage with HA mode
- Auto-unseal with cloud KMS
- External PostgreSQL/MySQL backend

## Security Notes

⚠️ **Important**: The default configuration is suitable for development only.

For production deployments:

1. Enable TLS for all communications
2. Use auto-unseal with cloud KMS
3. Configure proper RBAC policies
4. Enable audit logging
5. Use HA mode with multiple replicas
