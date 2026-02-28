# kgateway

## 简介

kgateway 是一个基于 Envoy Proxy 的云原生 API 网关。它提供了一种 Kubernetes 原生的方式来管理流量、保护 API 和观测服务。kgateway 前身为 Gloo Gateway，提供高级路由功能、流量管理和通过 WebAssembly (Wasm) 过滤器的可扩展性。

## 前置条件

在安装 kgateway 之前，请确保您已具备：

1. Kubernetes 集群 (1.25+)
2. 已安装 `kubectl`
3. 已安装 `helm` (3.8+ 以支持 OCI)

## 安装

### 快速安装（包含 CRDs）

要安装 kgateway 及其所有必需的 CRDs：

```bash
make install-all
```

### 分步安装

1. 安装 Kubernetes Gateway API CRDs：

    ```bash
    kubectl apply -f https://github.com/kubernetes-sigs/gateway-api/releases/download/v1.4.0/standard-install.yaml
    ```

2. 安装 kgateway CRDs：

    ```bash
    make install-crds
    ```

3. 安装 kgateway：

    ```bash
    make install
    ```

## 使用

安装完成后，验证部署状态：

```bash
# 检查 kgateway pod 是否运行
kubectl get pods -n kgateway-system

# 验证 GatewayClass 是否已创建
kubectl get gatewayclass kgateway

# 查看 kgateway 服务
kubectl get svc -n kgateway-system
```

## 配置

默认配置包括：

- 用于管理 Gateway API 资源的网关控制器
- 用于流量处理的 Envoy 代理部署
- 用于配置管理的控制平面组件

## Gateway API

kgateway 支持 Kubernetes Gateway API 标准。您可以创建 Gateway 和 HTTPRoute 资源来配置路由：

```yaml
apiVersion: gateway.networking.k8s.io/v1
kind: Gateway
metadata:
  name: my-gateway
  namespace: kgateway-system
spec:
  gatewayClassName: kgateway
  listeners:
    - name: http
      protocol: HTTP
      port: 80
```

## 卸载

卸载 kgateway：

```bash
make uninstall
```
