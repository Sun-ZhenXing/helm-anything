# Gitea

## 简介

Gitea 是一个社区管理的轻量级代码托管解决方案，使用 Go 语言编写。它根据 MIT 许可证发布，是一个无痛的自托管 Git 服务。

## 安装

要安装 Gitea，请运行：

```bash
make install
```

## 使用

安装完成后，验证部署：

```bash
kubectl get pods -n gitea
```

访问 Gitea：

```bash
kubectl port-forward svc/gitea-http 3000:3000 -n gitea
```

然后在浏览器中打开 <http://localhost:3000>。

## 文档

- [官方 Gitea 文档](https://docs.gitea.com/)
- [Helm Chart 源码](https://gitea.com/gitea/helm-chart)
