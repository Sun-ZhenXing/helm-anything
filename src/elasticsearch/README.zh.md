# Elasticsearch

## 简介

Elasticsearch 是一个分布式、RESTful 风格的搜索和数据分析引擎。

## 安装

要安装 Elasticsearch，请运行：

```bash
make install
```

## 使用

安装后，验证部署：

```bash
kubectl get pods -n elasticsearch
```

要访问 Elasticsearch，请端口转发服务：

```bash
kubectl port-forward svc/elasticsearch-master 9200:9200 -n elasticsearch
```

然后在 <http://localhost:9200> 访问
