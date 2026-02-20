# Vault

## 简介

HashiCorp Vault 是一个基于身份的秘密和加密管理系统。它提供安全的秘密存储、动态秘密、数据加密和基于身份的访问控制。

## 安装

安装 Vault：

```bash
make install
```

## 使用

安装完成后，初始化并解封 Vault：

```bash
# 端口转发以访问 Vault
kubectl port-forward svc/vault -n vault 8200:8200

# 初始化 Vault（保存解封密钥！）
vault operator init

# 解封 Vault（使用不同的密钥运行 3 次）
vault operator unseal

# 使用根令牌登录
vault login
```

在 <http://localhost:8200> 访问 UI。

## 配置

默认配置以单机模式运行 Vault，包括：

- 文件存储后端
- 10Gi 数据存储
- 10Gi 审计存储
- 启用 Kubernetes 认证方法

生产环境建议使用：

- 集成 Raft 存储的 HA 模式
- 使用云 KMS 自动解封
- 外部 PostgreSQL/MySQL 后端

## 安全注意事项

⚠️ **重要**：默认配置仅适用于开发环境。

生产环境部署需要：

1. 为所有通信启用 TLS
2. 使用云 KMS 自动解封
3. 配置适当的 RBAC 策略
4. 启用审计日志
5. 使用多副本 HA 模式
