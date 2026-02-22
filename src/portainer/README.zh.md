# Portainer

## 简介

Portainer 是一个轻量级的管理 UI，可让您轻松管理 Docker 和 Kubernetes 环境。它提供了一个简单直观的界面，用于部署和管理容器化应用程序，以及管理网络、卷和镜像等资源。

## 安装

安装 Portainer：

```bash
make install
```

## 使用

安装完成后，访问 Portainer：

### 使用 NodePort（默认）

Portainer 将在端口 `30777`（HTTP）和 `30779`（HTTPS）上可用。

```bash
# 端口转发以访问 Web UI
kubectl port-forward svc/portainer -n portainer 30777:9000 30779:9443
```

然后在浏览器中打开 `https://localhost:30779`。

### 使用 LoadBalancer

如果您配置了 `service.type=LoadBalancer`，获取外部 IP：

```bash
kubectl get svc -n portainer
```

然后在 `https://<EXTERNAL-IP>:9443` 访问 Portainer。

### 使用 Ingress

如果您配置了 ingress，请在您配置的主机名访问 Portainer。

## 初始设置

1. 在浏览器中打开 Portainer
2. 在初始设置页面创建管理员用户
3. 选择 "Kubernetes" 作为环境类型
4. 开始管理您的集群

## 配置

默认配置使用 NodePort 服务类型。您可以自定义：

- `service.type`: 更改为 `LoadBalancer` 或配合 ingress 使用 `ClusterIP`
- `tls.force`: 启用/禁用 TLS
- `persistence.storageClass`: 指定存储类
- `resources`: 调整 CPU/内存限制

## 功能

- **容器管理**: 部署、管理和监控容器
- **镜像管理**: 拉取、推送和管理容器镜像
- **网络管理**: 创建和管理 Docker 网络
- **卷管理**: 管理持久化存储
- **多环境**: 管理多个 Kubernetes 集群
- **RBAC**: 团队的基于角色的访问控制

## 自定义

编辑 `values.yaml` 以配置：

- Ingress 设置
- 资源限制
- 持久化选项
- TLS 配置
- 功能标志
