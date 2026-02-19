# MariaDB

## 简介

MariaDB 是一个高性能的开源关系数据库服务器，是 MySQL 的直接替代品。它支持单节点和 Galera 集群部署。

## 安装

要安装 MariaDB，请运行：

```bash
make install
```

## 使用

安装后，验证部署：

```bash
kubectl get pods -n mariadb
```

要从集群内部连接到 MariaDB：

```bash
kubectl exec -it -n mariadb deploy/mariadb -- mysql -u root -p
```

要从集群外部访问 MariaDB，请端口转发服务：

```bash
kubectl port-forward svc/mariadb 3306:3306 -n mariadb
```

然后使用以下方式连接：

```bash
mysql -h 127.0.0.1 -P 3306 -u root -p
```

## 配置

您可以通过编辑 `values.yaml` 来自定义 MariaDB 配置：

- `auth`: 配置数据库认证（root 密码、自定义用户）
- `galera`: 启用 Galera 集群模式以实现高可用性
- `persistence`: 配置 PVC 存储设置
- `metrics`: 启用 Prometheus 指标导出器

## Galera 集群

要启用 Galera 集群模式，请设置：

```yaml
galera:
  enabled: true
  replicaCount: 3
```

## 文档

更多信息请参阅：

- [MariaDB 官方网站](https://mariadb.org)
- [MariaDB 文档](https://mariadb.com/kb/en/documentation/)
