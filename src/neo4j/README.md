# Neo4j

## Introduction

Neo4j is a highly scalable, native graph database purpose-built to leverage not only data but also data relationships. Neo4j delivers lightning-fast read and write performance, while maintaining data integrity.

## Installation

To install Neo4j, run:

```bash
make install
```

## Usage

After installation, verify the deployment:

```bash
kubectl get pods -n neo4j
```

To connect to Neo4j Browser:

```bash
kubectl port-forward svc/neo4j 7474:7474 7687:7687 -n neo4j
```

Then open <http://localhost:7474> in your browser.

## Documentation

- [Official Neo4j Documentation](https://neo4j.com/docs/)
- [Helm Chart Source](https://github.com/neo4j/helm-charts)
