# ArgoCD

## 简介

ArgoCD 是一个用于 Kubernetes 的声明式、GitOps 持续交付工具。它遵循 GitOps 模式，使用 Git 仓库作为定义期望应用状态的单一事实来源。

## 安装

安装 ArgoCD：

```bash
make install
```

默认凭据：

- 用户名：`admin`
- 密码：`admin`

## 使用

安装完成后，访问 ArgoCD：

```bash
# 端口转发以访问 UI
kubectl port-forward svc/argocd-server -n argocd 8080:443

# 获取管理员密码
kubectl get secret argocd-initial-admin-secret -n argocd -o jsonpath="{.data.password}" | base64 -d
```

然后在浏览器中打开 <https://localhost:8080>。

## 配置

默认配置包括：

- 单 Redis 实例
- 单控制器副本
- 单仓库服务器
- 启用 Dex 用于 SSO

生产环境建议启用 HA 模式，使用多副本部署。
