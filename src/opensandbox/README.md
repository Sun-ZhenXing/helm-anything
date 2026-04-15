# OpenSandbox

## Introduction

OpenSandbox is a sandbox solution developed by Alibaba that provides secure, isolated environments for running applications. It enables users to create and manage sandboxed workloads with fine-grained resource control and security policies.

## Installation

To install OpenSandbox, run:

```bash
make install
```

This will:

1. Download the OpenSandbox Helm Chart (version 0.1.0) from GitHub Release
2. Install the OpenSandbox controller in the `opensandbox-system` namespace
3. Create the namespace if it doesn't exist

## Usage

After installation, verify the deployment:

```bash
kubectl get pods -n opensandbox-system
```

Check the controller logs:

```bash
kubectl logs -n opensandbox-system -l app=opensandbox-controller
```

## Version Information

- **Chart Version:** 0.1.0
- **App Version:** 0.1.0
- **Controller Image:** `sandbox-registry.cn-zhangjiakou.cr.aliyuncs.com/opensandbox/controller:v0.1.0`
- **Release Date:** 2026-03-03

## Uninstallation

To uninstall OpenSandbox:

```bash
make uninstall
```
