# Docker Registry

## 简介

Docker Registry 是一个无状态、高度可扩展的服务器端应用程序，用于存储和分发 Docker 镜像。它是开源的，采用 Apache-2.0 许可证。

此 Helm Chart 在 Kubernetes 上部署一个私有 Docker Registry，允许您在自己的基础设施中存储和管理容器镜像。

## 安装

安装 Docker Registry：

```bash
make install
```

## 使用

安装完成后，您可以向 registry 推送和拉取镜像：

```bash
# 端口转发以本地访问 registry
kubectl port-forward svc/registry -n registry 5000:5000

# 为私有 registry 标记镜像
docker tag my-image localhost:5000/my-image

# 推送到私有 registry
docker push localhost:5000/my-image

# 从私有 registry 拉取
docker pull localhost:5000/my-image
```

## 配置

默认配置包括：

- 内存存储（仅用于测试）
- 无认证
- 服务类型：ClusterIP

## 存储选项

生产使用请配置持久存储：

```yaml
persistence:
  enabled: true
  size: 10Gi
  storageClass: standard
```

## 认证

启用基本认证：

```yaml
secrets:
  htpasswd: |
    admin:$2y$05$...
```

## TLS

启用 TLS 进行安全通信：

```yaml
tlsSecretName: registry-tls
```

## 卸载

卸载 Docker Registry：

```bash
make uninstall
```
