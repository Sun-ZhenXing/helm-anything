# GitLab

## 简介

GitLab 是一个基于 Web 的 DevOps 生命周期工具，提供 Git 仓库管理器，具有 wiki、问题跟踪和 CI/CD 管道功能。

## 安装

要安装 GitLab，请运行：

```bash
make install
```

## 使用

安装完成后，验证部署：

```bash
kubectl get pods -n gitlab
```

访问 GitLab：

```bash
kubectl port-forward svc/gitlab-webservice-default 8080:8080 -n gitlab
```

然后在浏览器中打开 <http://localhost:8080>。

获取初始 root 密码：

```bash
kubectl get secret gitlab-gitlab-initial-root-password -n gitlab -ojsonpath='{.data.password}' | base64 --decode
```

## 文档

- [官方 GitLab 文档](https://docs.gitlab.com/)
- [Helm Chart 源码](https://gitlab.com/gitlab-org/charts/gitlab)
