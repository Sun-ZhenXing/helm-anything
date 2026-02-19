# Open WebUI

## 简介

Open WebUI 是一个可扩展、功能丰富且用户友好的自托管 AI 界面，旨在完全离线运行。它支持各种 LLM 运行器，包括 Ollama 和 OpenAI 兼容的 API。

## 安装

要安装 Open WebUI，请运行：

```bash
make install
```

## 使用

安装完成后，验证部署：

```bash
kubectl get pods -n open-webui
```

访问 Open WebUI：

```bash
kubectl port-forward svc/open-webui 8080:8080 -n open-webui
```

然后在浏览器中打开 <http://localhost:8080>。

## 文档

- [官方 Open WebUI 文档](https://docs.openwebui.com/)
- [Helm Chart 源码](https://github.com/open-webui/helm-charts)
