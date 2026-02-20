# Gitea

## Introduction

Gitea is a community managed lightweight code hosting solution written in Go. It is published under the MIT license and is a painless self-hosted Git service.

## Installation

To install Gitea, run:

```bash
make repo-add
make install
```

Or directly:

```bash
helm repo add gitea https://dl.gitea.com/charts
helm repo update
helm install gitea gitea/gitea -f values.yaml
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

Default admin credentials:

- Username: `gitea_admin`
- Password: `r8sA8CPHD9!bt6d`

## Configuration

### Current Configuration (Development)

当前配置为单实例开发环境，使用 SQLite 数据库。

### Production Configuration (High Availability)

生产环境建议使用以下配置（需取消注释并配置）：

```yaml
# 1. 禁用 SQLite，启用 PostgreSQL
valkey-cluster:
  enabled: true # 启用 Valkey 集群（缓存/会话/队列）

postgresql-ha:
  enabled: true # 启用 PostgreSQL HA

gitea:
  config:
    database:
      DB_TYPE: postgres
```

### Single-Pod Production (Non-HA)

如需单机生产环境（非高可用）：

```yaml
valkey-cluster:
  enabled: false
valkey:
  enabled: true
postgresql:
  enabled: true
postgresql-ha:
  enabled: false

gitea:
  config:
    database:
      DB_TYPE: postgres
```

### External Database

使用外部数据库：

```yaml
postgresql:
  enabled: false
postgresql-ha:
  enabled: false

gitea:
  config:
    database:
      DB_TYPE: postgres # or mysql
      HOST: my-db-host:5432
      NAME: gitea
      USER: gitea
      PASSWD: secret
```

### Ingress Configuration

```yaml
ingress:
  enabled: true
  hosts:
    - host: git.example.com
      paths:
        - path: /
  tls:
    - secretName: gitea-tls
      hosts:
        - git.example.com
```

## Helm Chart Values

查看所有可配置参数：

```bash
make values
# 或
helm show values gitea/gitea > gitea-values.yaml
```

## Important Changes (v12.x)

- **Redis → Valkey**: Chart v12.x 从 Redis 迁移到 Valkey/Valkey-cluster 作为缓存
- **Rootless by default**: 默认使用 rootless 镜像（更安全）
- **PostgreSQL-HA by default**: 默认使用 PostgreSQL HA（高可用）

## Documentation

- [Gitea Documentation](https://docs.gitea.com/)
- [Gitea Chinese Documentation](https://docs.gitea.cn/)
- [Gitea Helm Chart Source](https://gitea.com/gitea/helm-gitea)
- [Kubernetes Installation Guide](https://docs.gitea.cn/installation/install-on-kubernetes)
- [Gitea Configuration Cheat Sheet](https://docs.gitea.com/administration/config-cheat-sheet)

## Upgrade Notes

从旧版本升级时请参考：

- [Helm Chart Upgrading Guide](https://gitea.com/gitea/helm-gitea#upgrading)
