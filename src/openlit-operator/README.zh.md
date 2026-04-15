# OpenLIT Operator

## 简介

OpenLIT Operator 是一个 Kubernetes Operator，为零代码 AI 可观测性提供支持。它利用 OpenTelemetry 通过 init 容器注入探针，自动为 AI/LLM 工作负载（如 OpenAI、HuggingFace、LangChain 和向量数据库）添加可观测性，无需修改代码。

用于接收和可视化遥测数据的 OpenLIT 后端，请参阅 [openlit](../openlit/) 目录。

`auto-instrumentation.yaml` 中提供了示例 AutoInstrumentation 清单。

## 安装

安装 OpenLIT Operator：

```bash
make install
```

## 使用

安装完成后，验证 Operator 是否正常运行：

```bash
kubectl get pods -n openlit
```

使用示例 CRD 创建 `AutoInstrumentation` 资源：

```bash
kubectl apply -f auto-instrumentation.yaml -n default
```

重启你的应用 Deployment 以使 instrumentation 生效：

```bash
kubectl rollout restart deployment <your-deployment-name>
```

## 卸载

卸载：

```bash
make uninstall
```

## 文档

- [OpenLIT Operator 概览](https://docs.openlit.io/latest/operator/overview)
- [安装指南](https://docs.openlit.io/latest/operator/installation)
- [配置说明](https://docs.openlit.io/latest/operator/configuration/operator)
