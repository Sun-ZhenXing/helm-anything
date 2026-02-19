# Open WebUI

## Introduction

Open WebUI is an extensible, feature-rich, and user-friendly self-hosted AI interface designed to operate entirely offline. It supports various LLM runners, including Ollama and OpenAI-compatible APIs.

## Installation

To install Open WebUI, run:

```bash
make install
```

## Usage

After installation, verify the deployment:

```bash
kubectl get pods -n open-webui
```

To access Open WebUI:

```bash
kubectl port-forward svc/open-webui 8080:8080 -n open-webui
```

Then open <http://localhost:8080> in your browser.

## Documentation

- [Official Open WebUI Documentation](https://docs.openwebui.com/)
- [Helm Chart Source](https://github.com/open-webui/helm-charts)
