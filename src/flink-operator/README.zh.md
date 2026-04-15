# Apache Flink Kubernetes Operator

## 简介

Apache Flink Kubernetes Operator 用于管理 Kubernetes 上 Apache Flink 应用的生命周期。此 Chart 仅安装 Operator，Flink 集群通过 FlinkDeployment CRD 创建——没有独立的 Flink 集群 Helm Chart。

示例 FlinkDeployment 清单位于 `flink-deployment.yaml`。

## 安装

```bash
make install
```

## 使用

先验证 Operator Pod 运行正常：

```bash
kubectl get pods -n flink-operator
```

使用示例 CRD 创建 Flink 集群：

```bash
kubectl apply -f flink-deployment.yaml -n flink
```

检查 Flink 资源状态：

```bash
kubectl get flinkdeployments -n flink
```

## 卸载

```bash
make uninstall
```

## 文档

- [Flink Kubernetes Operator 文档](https://nightlies.apache.org/flink/flink-kubernetes-operator-docs-stable/)
- [Apache Flink Kubernetes Operator GitHub](https://github.com/apache/flink-kubernetes-operator)
