# Sealos

## 简介

Sealos 是一个云原生 Kubernetes 发行版和集群管理平台，提供以下功能：

- **Kubernetes 生命周期管理**：轻松安装和管理 Kubernetes 集群
- **应用管理**：使用简单命令部署和管理应用程序
- **云终端**：内置云终端用于集群操作
- **多集群管理**：从单一界面管理多个 Kubernetes 集群
- **应用商店**：内置流行应用市场

## 安装

要安装 Sealos，请运行：

```bash
make install
```

这将在 `sealos` 命名空间中部署 Sealos。

## 前置条件

- Kubernetes v1.27+
- Helm v3.14+
- 集群管理员权限

## 使用

安装完成后，验证部署状态：

```bash
kubectl get pods -n sealos
```

要访问 Sealos 控制台：

```bash
kubectl get svc -n sealos
```

如果您使用的是 LoadBalancer 服务类型，获取外部 IP：

```bash
kubectl get svc sealos -n sealos
```

或者使用 port-forward 进行本地访问：

```bash
kubectl port-forward -n sealos svc/sealos 8080:6443
```

然后访问：`http://localhost:8080`

## 配置

您可以通过修改 `values.yaml` 文件来自定义安装：

- `image.repository` 和 `image.tag`：更改 Sealos 镜像
- `persistence`：配置持久化存储
- `service.type`：更改服务类型（ClusterIP、NodePort、LoadBalancer）
- `auth.enableTLS`：为 API 端点启用 TLS
- `ingress`：配置外部访问的 ingress

## 卸载

要卸载 Sealos：

```bash
make uninstall
```

## 文档

更多信息请参阅官方文档：

- [Sealos 文档](https://sealos.io/docs/)
- [Helm Chart 仓库](https://github.com/seal-io/helm-charts)
