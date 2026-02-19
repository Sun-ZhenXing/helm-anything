# Nacos

## 简介

Nacos 是一个易于使用的平台，专为动态服务发现、配置管理和服务管理而设计。它帮助您更快速、更轻松地构建云原生应用程序和微服务。

## 安装

要安装 Nacos，请运行：

```bash
make install
```

## 使用

安装完成后，验证部署：

```bash
kubectl get pods -n nacos
```

访问 Nacos 控制台：

```bash
kubectl port-forward svc/nacos 8848:8848 -n nacos
```

然后在浏览器中打开 <http://localhost:8848/nacos>。

默认凭据：nacos/nacos

## 文档

- [官方 Nacos 文档](https://nacos.io/zh-cn/docs/what-is-nacos.html)
- [Helm Chart 源码](https://github.com/nacos-group/nacos-k8s)
