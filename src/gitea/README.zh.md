# Gitea

## 简介

Gitea 是一个社区管理的轻量级代码托管解决方案，使用 Go 语言编写。它根据 MIT 许可证发布，是一个无痛的自托管 Git 服务。

## 安装

要安装 Gitea，请运行：

```bash
make repo-add
make install
```

或者直接使用 Helm：

```bash
helm repo add gitea https://dl.gitea.com/charts
helm repo update
helm install gitea gitea/gitea -f values.yaml
```

## 使用

安装完成后，验证部署：

```bash
kubectl get pods -n gitea
```

访问 Gitea：

```bash
kubectl port-forward svc/gitea-http 3000:3000 -n gitea
```

然后在浏览器中打开 <http://localhost:3000>。

默认管理员账户：

- 用户名：`gitea_admin`
- 密码：`r8sA8CPHD9!bt6d`

## 配置说明

### 当前配置（开发环境）

当前配置为单实例开发环境，使用 SQLite 数据库，适合快速测试和开发。

### 生产环境配置（高可用）

生产环境建议使用以下配置：

```yaml
# 启用 Valkey 集群和 PostgreSQL HA
valkey-cluster:
  enabled: true # 启用 Valkey 集群作为缓存/会话/队列存储

postgresql-ha:
  enabled: true # 启用 PostgreSQL 高可用

gitea:
  config:
    database:
      DB_TYPE: postgres
```

### 单机生产环境（非高可用）

如需单机生产环境：

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

### 使用外部数据库

如需使用外部数据库：

```yaml
postgresql:
  enabled: false
postgresql-ha:
  enabled: false

gitea:
  config:
    database:
      DB_TYPE: postgres # 或 mysql
      HOST: my-db-host:5432
      NAME: gitea
      USER: gitea
      PASSWD: secret
```

### Ingress 配置

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

## 查看所有配置参数

```bash
make values
# 或
helm show values gitea/gitea > gitea-values.yaml
```

## v12.x 重要变更

- **Redis → Valkey**: Chart v12.x 从 Redis 迁移到 Valkey/Valkey-cluster 作为缓存组件
- **默认使用 rootless 镜像**: 更安全，但 SSH 监听端口改为 2222
- **默认使用 PostgreSQL HA**: 高可用数据库配置

## 文档链接

- [Gitea 文档](https://docs.gitea.com/)
- [Gitea 中文文档](https://docs.gitea.cn/)
- [Gitea Helm Chart 源码](https://gitea.com/gitea/helm-gitea)
- [Kubernetes 安装指南](https://docs.gitea.cn/installation/install-on-kubernetes)
- [Gitea 配置速查表](https://docs.gitea.com/administration/config-cheat-sheet)

## 升级注意事项

从旧版本升级时请参考：

- [Helm Chart 升级指南](https://gitea.com/gitea/helm-gitea#upgrading)
