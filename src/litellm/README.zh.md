# LiteLLM

## 简介

LiteLLM 是一个统一的 API，可以使用 OpenAI 格式调用 100+ 个 LLM API（OpenAI、Anthropic、Azure、VertexAI、Bedrock、Cohere、Mistral、Ollama 等）。

## 安装

要安装 LiteLLM，请运行：

```bash
make install
```

## 使用

安装完成后，验证部署：

```bash
kubectl get pods -n litellm
```

要配置 LiteLLM，请在 values.yaml 文件中编辑您的 LLM 提供商 API 密钥。

## 文档

- [官方 LiteLLM 文档](https://docs.litellm.ai/)
- [Helm Chart 源码](https://github.com/BerriAI/litellm/tree/main/deploy/charts/litellm-helm)
