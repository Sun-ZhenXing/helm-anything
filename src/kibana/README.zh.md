# Kibana

## 简介

Kibana 是一个用于日志和时间序列分析、应用监控和运营智能用例的数据可视化和探索工具。

## 安装

要安装 Kibana，请运行：

```bash
make install
```

## 使用

安装后，验证部署：

```bash
kubectl get pods -n kibana
```

要访问 Kibana，请端口转发服务：

```bash
kubectl port-forward svc/kibana-kibana 5601:5601 -n kibana
```

然后在 <http://localhost:5601> 访问
