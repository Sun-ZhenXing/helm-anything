# Nginx

## 简介

Nginx 是一个高性能的 HTTP 服务器和反向代理，以其稳定性、丰富的功能集、简单的配置和低资源消耗而闻名。

## 安装

要安装 Nginx，请运行：

```bash
make install
```

## 使用

安装后，验证部署：

```bash
kubectl get pods -n nginx
```

要访问 Nginx，请端口转发服务：

```bash
kubectl port-forward svc/nginx 8080:80 -n nginx
```

然后在 <http://localhost:8080> 访问

## 配置

您可以通过编辑 `values.yaml` 来自定义 Nginx 配置：

- `config`: 自定义 nginx.conf 内容
- `serverConfig`: 自定义服务器块配置
- `staticSiteConfigmap`: 使用带有静态站点内容的现有 ConfigMap
- `ingress`: 配置 ingress 以进行外部访问

## 文档

更多信息请参阅：

- [Nginx 官方网站](https://www.nginx.com)
- [Nginx 文档](https://nginx.org/en/docs/)
