# Apache APISIX

## 简介

Apache APISIX 是一个动态、实时、高性能的 API 网关。它提供丰富的流量管理功能，如负载均衡、动态上游、灰度发布、熔断、认证、可观测性等。

## 安装

安装 APISIX：

```bash
make install
```

## 使用

安装完成后，访问 APISIX：

```bash
# 端口转发以访问 Admin API
kubectl port-forward svc/apisix-admin -n apisix 9180:9180

# 访问 Admin API
curl http://localhost:9180/apisix/admin/routes -H 'X-API-Key: edd1c9f034335f136f87ad84b625c8f1'
```

默认 Admin API 密钥：`edd1c9f034335f136f87ad84b625c8f1`

## 配置

默认配置包括：

- 启用 Admin API 的 APISIX 服务器
- etcd 作为配置存储
- Dashboard（如果启用）
- Ingress Controller（如果启用）

## 组件

- **APISIX**: 核心 API 网关服务器
- **etcd**: 配置存储后端
- **Dashboard**: 管理 Web UI（可选）
- **Ingress Controller**: Kubernetes 入口支持（可选）

## 创建路由

路由配置示例：

```bash
curl http://localhost:9180/apisix/admin/routes/1 \
  -H 'X-API-Key: edd1c9f034335f136f87ad84b625c8f1' \
  -X PUT -d '
{
  "uri": "/hello",
  "upstream": {
    "type": "roundrobin",
    "nodes": {
      "127.0.0.1:1980": 1
    }
  }
}'
```

## 卸载

卸载 APISIX：

```bash
make uninstall
```
