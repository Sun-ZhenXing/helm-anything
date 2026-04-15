# ECK Operator (Elastic Cloud on Kubernetes)

## 简介

ECK (Elastic Cloud on Kubernetes) 是 Elastic 官方的 Kubernetes Operator，用于编排 Elasticsearch、Kibana、APM Server、Enterprise Search 和 Beats。

此 Chart 仅安装 ECK Operator。Elasticsearch、Kibana 及其他 Elastic 资源在 Operator 安装后通过 CRD 创建。

## 安装

安装 ECK Operator：

```bash
make install
```

## 使用

安装完成后，验证 Operator 是否正常运行：

```bash
kubectl get pods -n elastic-system
```

检查 CRD 是否已注册：

```bash
kubectl get crd | grep elastic
```

### 创建 Elasticsearch 集群

```yaml
apiVersion: elasticsearch.k8s.elastic.co/v1
kind: Elasticsearch
metadata:
  name: quickstart
spec:
  version: 8.15.0
  nodeSets:
    - name: default
      count: 1
      config:
        node.store.allow_mmap: false
```

应用清单：

```bash
kubectl apply -f elasticsearch.yaml
```

### 创建 Kibana 实例

```yaml
apiVersion: kibana.k8s.elastic.co/v1
kind: Kibana
metadata:
  name: quickstart
spec:
  version: 8.15.0
  count: 1
  elasticsearchRef:
    name: quickstart
```

应用清单：

```bash
kubectl apply -f kibana.yaml
```

## 卸载

卸载：

```bash
make uninstall
```

## 文档

- [ECK 文档](https://www.elastic.co/guide/en/cloud-on-k8s/current/)
- [ECK GitHub](https://github.com/elastic/cloud-on-k8s)
- [ECK Helm Chart](https://github.com/elastic/cloud-on-k8s/tree/main/deploy/eck-operator)
