# kgateway

## 简介

kgateway 是一个基于 Envoy Proxy 的云原生 API 网关。它提供了一种 Kubernetes 原生的方式来管理流量、保护 API 和观测服务。kgateway 前身为 Gloo Gateway，提供高级路由功能、流量管理和通过 WebAssembly (Wasm) 过滤器的可扩展性。

## 安装

安装 kgateway：

```bash
make install
```

## 使用

安装完成后，您可以使用 Kubernetes Gateway API 资源来配置 kgateway：

```bash
# 检查 kgateway pod 是否运行
kubectl get pods -n kgateway-system

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
