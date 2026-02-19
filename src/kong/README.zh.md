# Kong Gateway

## 简介

Kong Gateway 是一个轻量级、快速、灵活的云原生 API 网关。它基于 NGINX 和 OpenResty 构建，为 API 和微服务提供可扩展的高性能网关。

## 安装

要安装 Kong Gateway，请运行：

```bash
make install
```

## 使用

安装完成后，验证部署：

```bash
kubectl get pods -n kong
```

访问 Kong Admin API：

```bash
kubectl port-forward svc/kong-admin 8001:8001 -n kong
```

访问 Kong Proxy：

```bash
kubectl port-forward svc/kong-proxy 8000:8000 -n kong
```

## 文档

- [官方 Kong 文档](https://docs.konghq.com/)
- [Helm Chart 源码](https://github.com/Kong/charts)
