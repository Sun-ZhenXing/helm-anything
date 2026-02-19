# Keycloak

## Introduction

Keycloak is an open source identity and access management solution. It provides user federation, strong authentication, user management, fine-grained authorization, and more.

## Installation

To install Keycloak, run:

```bash
make install
```

## Usage

After installation, verify the deployment:

```bash
kubectl get pods -n keycloak
```

To access Keycloak, port-forward the service:

```bash
kubectl port-forward svc/keycloak 8080:8080 -n keycloak
```

Then access the admin console at <http://localhost:8080/admin>

Default credentials:

- Username: `admin`
- Password: (see `values.yaml` keycloak.adminPassword)

## Configuration

You can customize Keycloak by editing `values.yaml`:

- `keycloak`: Core Keycloak settings (admin user, hostname, production mode)
- `database`: External database configuration (PostgreSQL, MySQL, MariaDB)
- `postgres`: Embedded PostgreSQL configuration
- `ingress`: Configure ingress for external access
- `tls`: Enable TLS/HTTPS support

## Production Mode

For production deployments, set:

```yaml
keycloak:
  production: true
  hostname: keycloak.yourdomain.com
  hostnameStrict: true
```

## External Database

To use an external database instead of the embedded PostgreSQL:

```yaml
postgres:
  enabled: false

database:
  type: postgres
  host: postgres.example.com
  port: 5432
  name: keycloak
  username: keycloak
  password: your-password
```

## Documentation

For more information, see:

- [Keycloak Official Website](https://www.keycloak.org)
- [Keycloak Documentation](https://www.keycloak.org/documentation)
