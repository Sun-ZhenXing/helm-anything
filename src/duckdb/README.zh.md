# DuckDB (通过 JupyterHub)

## 简介

DuckDB 是一个进程内 SQL OLAP 数据库管理系统。由于 DuckDB 是嵌入式数据库，没有服务器模式，此部署使用预装了 DuckDB 的 JupyterHub 来提供用于 DuckDB 数据分析的笔记本环境。

## 安装

要安装支持 DuckDB 的 JupyterHub，请运行：

```bash
make install
```

## 使用

安装完成后，验证部署：

```bash
kubectl get pods -n duckdb
```

访问 JupyterHub：

```bash
kubectl port-forward svc/proxy-public 8080:80 -n duckdb
```

然后在浏览器中打开 <http://localhost:8080>。

## 使用 DuckDB

在 Jupyter 笔记本中，您可以使用 Python 使用 DuckDB：

```python
import duckdb

# 连接到 DuckDB
con = duckdb.connect()

# 运行 SQL 查询
con.execute("SELECT 42").fetchall()

# 直接查询数据文件
con.execute("SELECT * FROM 'data.parquet' LIMIT 10").fetchdf()
```

## 文档

- [官方 DuckDB 文档](https://duckdb.org/docs/)
- [JupyterHub Helm Chart 源码](https://github.com/jupyterhub/helm-chart)
