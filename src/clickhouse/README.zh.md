# ClickHouse

## 简介

ClickHouse 是一个开源的面向列的数据库管理系统，用于在线分析处理 (OLAP)。

此 Chart 使用 Altinity Helm chart 部署 ClickHouse。如需 Operator 管理的 ClickHouse 集群（支持自动部署、扩缩容和配置），请参阅 [clickhouse-operator](../clickhouse-operator/) 目录。

## 安装

要安装 ClickHouse，请运行：

```bash
make install
```

## 使用

安装后，验证部署：

```bash
kubectl get pods -n clickhouse
```

要连接到 ClickHouse：

```bash
kubectl -n clickhouse exec -it chi-clickhouse-clickhouse-0-0-0 -- clickhouse-client
```
