# MLflow

## 简介

MLflow 是一个开源平台，用于管理机器学习生命周期，包括实验、可重复性、部署和中央模型注册表。

## 安装

要安装 MLflow，请运行：

```bash
make install
```

## 使用

安装完成后，验证部署：

```bash
kubectl get pods -n mlflow
```

访问 MLflow UI：

```bash
kubectl port-forward svc/mlflow 5000:5000 -n mlflow
```

然后在浏览器中打开 <http://localhost:5000>。

## 文档

- [官方 MLflow 文档](https://mlflow.org/docs/latest/index.html)
- [Helm Chart 源码](https://github.com/community-charts/helm-charts/tree/main/charts/mlflow)
