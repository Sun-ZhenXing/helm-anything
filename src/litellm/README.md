# LiteLLM

## Introduction

LiteLLM is a unified API to call over 100+ LLM APIs (OpenAI, Anthropic, Azure, VertexAI, Bedrock, Cohere, Mistral, Ollama, etc.) using the OpenAI format.

## Installation

To install LiteLLM, run:

```bash
make install
```

## Usage

After installation, verify the deployment:

```bash
kubectl get pods -n litellm
```

To configure LiteLLM, edit the values.yaml file with your LLM provider API keys.

## Documentation

- [Official LiteLLM Documentation](https://docs.litellm.ai/)
- [Helm Chart Source](https://github.com/BerriAI/litellm/tree/main/deploy/charts/litellm-helm)
