# NebulaGraph Operator

## 简介

NebulaGraph Operator 是一个 Kubernetes Operator，用于自动化部署、扩展和管理 NebulaGraph 集群。它通过自定义资源定义（CRD）扩展 Kubernetes 以管理 NebulaGraph 组件。

此 Chart 仅安装 NebulaGraph Operator。要部署 NebulaGraph 集群，请参阅 [nebulagraph](../nebulagraph/) 目录。

## 安装

安装 NebulaGraph Operator：

```bash
make install
```

## 使用

安装完成后，验证 Operator 是否正常运行：

```bash
kubectl get pods -n nebula-operator-system
```

检查 CRD 是否已注册：

```bash
kubectl get crd | grep nebula
```

## 卸载

卸载：

```bash
make uninstall
```

## 文档

- [NebulaGraph Operator 文档](https://docs.nebula-graph.io/master/k8s-operator/1.introduction/)
- [NebulaGraph Operator GitHub](https://github.com/vesoft-inc/nebula-operator)
