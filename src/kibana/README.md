# Kibana

## Introduction

Kibana is a data visualization and exploration tool used for log and time-series analytics, application monitoring, and operational intelligence use cases.

## Installation

To install Kibana, run:

```bash
make install
```

## Usage

After installation, verify the deployment:

```bash
kubectl get pods -n kibana
```

To access Kibana, port-forward the service:

```bash
kubectl port-forward svc/kibana-kibana 5601:5601 -n kibana
```

Then access at <http://localhost:5601>
