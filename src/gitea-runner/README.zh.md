# Gitea Actions Runner

## 简介

Gitea Actions Runner (act_runner) 是 Gitea Actions 的运行器。此 Helm chart 在正在运行的 Gitea 实例旁边部署 Gitea act-runners。

## 安装

要安装 Gitea Actions Runner，请运行：

```bash
make install
```

## 配置

在安装之前，您需要在 values.yaml 中配置 runner：

```yaml
statefulset:
  actRunner:
    config: |
      # 您的 Gitea 实例 URL 和注册令牌
```

## 使用

安装完成后，验证部署：

```bash
kubectl get pods -n gitea-runner
```

## 文档

- [官方 Gitea 文档](https://docs.gitea.com/usage/actions/overview)
- [Helm Chart 源码](https://gitea.com/gitea/helm-actions)
