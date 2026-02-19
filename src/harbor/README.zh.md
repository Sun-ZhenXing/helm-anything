# Harbor

## 简介

Harbor 是一个开源的受信任云原生注册表项目，用于存储、签名和扫描内容。Harbor 通过添加用户通常需要的功能（如安全性、身份和管理）来扩展开源 Docker Distribution。

## 安装

要安装 Harbor，请运行：

```bash
make install
```

## 使用

安装完成后，验证部署：

```bash
kubectl get pods -n harbor
```

访问 Harbor 门户：

```bash
kubectl port-forward svc/harbor-portal 8080:80 -n harbor
```

然后在浏览器中打开 <http://localhost:8080>。

默认凭据：admin/Harbor12345

## 文档

- [官方 Harbor 文档](https://goharbor.io/docs/)
- [Helm Chart 源码](https://github.com/goharbor/harbor-helm)
