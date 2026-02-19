# GitLab Runner

## 简介

GitLab Runner 是一个开源项目，用于运行您的作业并将结果发送回 GitLab。它与 GitLab CI/CD 一起使用，这是 GitLab 包含的开源持续集成服务。

## 安装

要安装 GitLab Runner，请运行：

```bash
make install
```

## 配置

在安装之前，您需要在 values.yaml 中配置 runner 注册令牌：

```yaml
gitlabUrl: 'https://gitlab.example.com'
runnerRegistrationToken: YOUR_REGISTRATION_TOKEN
```

## 使用

安装完成后，验证部署：

```bash
kubectl get pods -n gitlab-runner
```

## 文档

- [官方 GitLab Runner 文档](https://docs.gitlab.com/runner/)
- [Helm Chart 源码](https://gitlab.com/gitlab-org/charts/gitlab-runner)
