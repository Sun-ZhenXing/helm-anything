# DuckDB (via JupyterHub)

## Introduction

DuckDB is an in-process SQL OLAP database management system. Since DuckDB is an embedded database and doesn't have a server mode, this deployment uses JupyterHub with DuckDB pre-installed to provide a notebook environment for data analysis with DuckDB.

## Installation

To install JupyterHub with DuckDB support, run:

```bash
make install
```

## Usage

After installation, verify the deployment:

```bash
kubectl get pods -n duckdb
```

To access JupyterHub:

```bash
kubectl port-forward svc/proxy-public 8080:80 -n duckdb
```

Then open <http://localhost:8080> in your browser.

## Using DuckDB

In a Jupyter notebook, you can use DuckDB with Python:

```python
import duckdb

# Connect to DuckDB
con = duckdb.connect()

# Run SQL queries
con.execute("SELECT 42").fetchall()

# Query data files directly
con.execute("SELECT * FROM 'data.parquet' LIMIT 10").fetchdf()
```

## Documentation

- [Official DuckDB Documentation](https://duckdb.org/docs/)
- [JupyterHub Helm Chart Source](https://github.com/jupyterhub/helm-chart)
