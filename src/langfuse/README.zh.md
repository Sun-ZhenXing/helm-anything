# Langfuse

## 简介

Langfuse 是一个开源的 LLM 工程平台，用于可观测性、提示管理和评估。

## 安装

要安装 Langfuse，请运行：

```bash
make install
```

## 使用

安装后，验证部署：

```bash
kubectl get pods -n langfuse
```

要访问 Langfuse，请端口转发服务：

```bash
kubectl port-forward svc/langfuse 3000:3000 -n langfuse
```

然后在 <http://localhost:3000> 访问
