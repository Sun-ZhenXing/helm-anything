# agentgateway

## 简介

agentgateway 是一个专为 AI 工作负载设计的云原生 API 网关。它提供了一种 Kubernetes 原生的方式来管理流量、保护 API 和观测 AI 服务。agentgateway 基于 Kubernetes Gateway API 构建，可实现与 AI 代理和服务的无缝集成。

## 前置条件

在安装 agentgateway 之前，请确保您已具备：

1. Kubernetes 集群 (1.25+)
2. 已安装 `kubectl`
3. 已安装 `helm` (3.8+ 以支持 OCI)

## 安装

### 快速安装（包含 CRDs）

要安装 agentgateway 及其所有必需的 CRDs：

```bash
make install-all
```

### 分步安装

1. 安装 Gateway API CRDs：

    ```bash
    kubectl apply -f https://github.com/kubernetes-sigs/gateway-api/releases/download/v1.4.0/standard-install.yaml
    ```

2. 安装 agentgateway CRDs：

    ```bash
    make install-crds
    ```

3. 安装 agentgateway：

    ```bash
    make install
    ```

## 使用

安装完成后，验证部署状态：

```bash
# 检查 agentgateway pod 是否运行
kubectl get pods -n agentgateway-system

# 验证 GatewayClass 是否已创建
kubectl get gatewayclass agentgateway

# 查看 agentgateway 服务
kubectl get svc -n agentgateway-system
```

## 配置

默认配置包括：

- 用于管理 Gateway API 资源的网关控制器
- 用于配置管理的控制平面组件
- 支持 AI 工作负载路由

您可以在运行 `make install` 之前修改 `values.yaml` 来自定义安装。

## Gateway API

agentgateway 支持 Kubernetes Gateway API 标准。您可以创建 Gateway 和 HTTPRoute 资源来配置路由：

```yaml
apiVersion: gateway.networking.k8s.io/v1
kind: Gateway
metadata:
  name: my-gateway
  namespace: agentgateway-system
spec:
  gatewayClassName: agentgateway
  listeners:
    - name: http
      protocol: HTTP
      port: 80
```

## 卸载

卸载 agentgateway：

```bash
make uninstall
```

## 文档

更多信息请访问[官方文档](https://agentgateway.dev/docs/kubernetes/latest/)。
