# Keycloak

## 简介

Keycloak 是一个开源的身份和访问管理解决方案。它提供用户联合、强身份认证、用户管理、细粒度授权等功能。

## 安装

要安装 Keycloak，请运行：

```bash
make install
```

## 使用

安装后，验证部署：

```bash
kubectl get pods -n keycloak
```

要访问 Keycloak，请端口转发服务：

```bash
kubectl port-forward svc/keycloak 8080:8080 -n keycloak
```

然后在 <http://localhost:8080/admin> 访问管理控制台

默认凭据：

- 用户名：`admin`
- 密码：（参见 `values.yaml` 中的 keycloak.adminPassword）

## 配置

您可以通过编辑 `values.yaml` 来自定义 Keycloak：

- `keycloak`: 核心 Keycloak 设置（管理员用户、主机名、生产模式）
- `database`: 外部数据库配置（PostgreSQL、MySQL、MariaDB）
- `postgres`: 嵌入式 PostgreSQL 配置
- `ingress`: 配置 ingress 以进行外部访问
- `tls`: 启用 TLS/HTTPS 支持

## 生产模式

对于生产部署，请设置：

```yaml
keycloak:
  production: true
  hostname: keycloak.yourdomain.com
  hostnameStrict: true
```

## 外部数据库

要使用外部数据库而不是嵌入式 PostgreSQL：

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

## 文档

更多信息请参阅：

- [Keycloak 官方网站](https://www.keycloak.org)
- [Keycloak 文档](https://www.keycloak.org/documentation)
