# OpenLIT

## 简介

OpenLIT 是一个开源的 AI/LLM 应用可观测性平台。它为 AI 工作负载（包括 OpenAI、HuggingFace、LangChain 和向量数据库）提供监控、追踪和分析功能。此 Chart 部署 OpenLIT 后端，用于接收和可视化遥测数据。

如需对应用进行零代码 AI 探针注入，请安装 [openlit-operator](../openlit-operator/)，它通过 init 容器自动注入 OpenTelemetry 探针。

## 安装

要安装 OpenLIT，请运行：

```bash
make install
```

## 使用

安装完成后，验证部署：

```bash
kubectl get pods -n openlit
```

要访问 OpenLIT 仪表板，请端口转发服务：

```bash
kubectl port-forward svc/openlit 8080:8080 -n openlit
```

然后在 <http://localhost:8080> 访问

## 卸载

卸载 OpenLIT：

```bash
make uninstall
```

## 文档

- [OpenLIT 文档](https://docs.openlit.io/)
- [OpenLIT GitHub](https://github.com/openlit/openlit)
- [OpenLIT Operator](https://docs.openlit.io/latest/operator/overview)
