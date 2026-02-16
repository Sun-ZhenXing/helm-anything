# MinIO

## 简介

MinIO 是一个高性能、与 S3 兼容的对象存储。

## 安装

要安装 MinIO，请运行：

```bash
make install
```

## 使用

安装后，验证部署：

```bash
kubectl get pods -n minio
```

要访问 MinIO，请端口转发服务：

```bash
kubectl port-forward svc/minio 9000:9000 -n minio
```

然后在 <http://localhost:9000> 访问控制台
