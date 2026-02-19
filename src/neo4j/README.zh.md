# Neo4j

## 简介

Neo4j 是一个高度可扩展的本地图数据库，专门用于利用数据以及数据之间的关系。Neo4j 提供闪电般的读写性能，同时保持数据完整性。

## 安装

要安装 Neo4j，请运行：

```bash
make install
```

## 使用

安装完成后，验证部署：

```bash
kubectl get pods -n neo4j
```

连接 Neo4j 浏览器：

```bash
kubectl port-forward svc/neo4j 7474:7474 7687:7687 -n neo4j
```

然后在浏览器中打开 <http://localhost:7474>。

## 文档

- [官方 Neo4j 文档](https://neo4j.com/docs/)
- [Helm Chart 源码](https://github.com/neo4j/helm-charts)
