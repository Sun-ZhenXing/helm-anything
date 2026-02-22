# Rancher

## 简介

Rancher 是一个完整的容器管理平台，可让您轻松地在任何地方运行 Kubernetes。它解决了三个主要的运营挑战：在任何基础设施上配置 Kubernetes 集群、将不同的 Kubernetes 集群统一到集中式认证和访问控制下，以及跨集群的工作负载管理。

## 前置条件

- Kubernetes 集群（RKE2、K3s 或任何经过认证的 Kubernetes 发行版）
- 已安装 cert-manager（建议 v1.8.0 或更高版本）
- 配置了默认 StorageClass

## 安装

安装 Rancher：

```bash
make install
```

## 使用

安装完成后，访问 Rancher：

### 获取 Rancher URL

```bash
# 对于 LoadBalancer 服务类型
kubectl get svc -n cattle-system

# 对于 NodePort 服务类型
kubectl get svc -n cattle-system
```

### 获取引导密码

```bash
kubectl get secret --namespace cattle-system bootstrap-secret -o go-template='{{.data.bootstrapPassword|base64decode}}{{ "\n" }}'
```

### 访问 UI

1. 在浏览器中打开 Rancher URL
2. 使用用户名 `admin` 和引导密码登录
3. 按照设置向导配置 Rancher

## 配置

### SSL/TLS 配置

Rancher 支持多种 SSL/TLS 配置：

- **rancher**: 使用 Rancher 生成的 CA 证书（默认）
- **letsEncrypt**: 使用 Let's Encrypt 进行自动证书管理
- **secret**: 使用您自己的 TLS 证书

### 服务类型

- **LoadBalancer**: 推荐用于生产环境（需要云提供商或 MetalLB）
- **NodePort**: 用于本地/开发环境
- **ClusterIP**: 用于 ingress 控制器配置

## 功能

- **多集群管理**: 从单一界面管理多个 Kubernetes 集群
- **用户管理**: 集中式认证和 RBAC
- **应用目录**: 从 Helm charts 部署应用程序
- **监控**: 内置 Prometheus 和 Grafana 监控
- **日志**: 使用 Fluentd 的集中式日志
- **Istio 服务网格**: 部署和管理 Istio
- **CI/CD 流水线**: 与 Fleet 集成的 CI/CD

## 自定义

编辑 `values.yaml` 以配置：

- `hostname`: Rancher 的 FQDN
- `ingress.tls.source`: SSL 证书源
- `replicas`: Rancher 副本数
- `resources`: CPU/内存限制
- `auditLog`: 审计日志配置

## 重要提示

1. Rancher 只能安装在支持的 Kubernetes 集群上
2. 引导密码在安装时自动生成
3. 对于生产环境，使用适当的 SSL 证书和主机名
4. 考虑使用 Rancher Backup operator 进行灾难恢复
