# ClickHouse

## 简介

ClickHouse 是一个开源的面向列的数据库管理系统，用于在线分析处理 (OLAP)。

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
