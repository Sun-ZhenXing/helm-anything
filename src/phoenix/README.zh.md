# Phoenix

## 简介

Arize Phoenix 是一个开源工具，用于 ML 可观测性，在您的笔记本或应用中运行以可视化和监控模型性能。

## 安装

要安装 Phoenix，请运行：

```bash
make install
```

## 使用

安装后，验证部署：

```bash
kubectl get pods -n phoenix
```

要访问 Phoenix，请端口转发服务：

```bash
kubectl port-forward svc/phoenix 6006:6006 -n phoenix
```

然后在 <http://localhost:6006> 访问
