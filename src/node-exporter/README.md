# Prometheus Node Exporter

## Introduction

Prometheus Node Exporter is a Prometheus exporter for hardware and OS metrics exposed by *NIX kernels. It collects system-level metrics such as CPU, memory, disk, and network usage from Linux/Unix systems.

This Helm chart deploys Node Exporter as a DaemonSet on Kubernetes, ensuring that one instance runs on each node to collect host-level metrics.

## Installation

To install Node Exporter, run:

```bash
make install
```

## Usage

After installation:

```bash
# Check if Node Exporter pods are running on all nodes
kubectl get pods -n monitoring -l app.kubernetes.io/name=prometheus-node-exporter

# View metrics
curl http://<node-ip>:9100/metrics
```

## Configuration

The default configuration includes:

- DaemonSet deployment (one pod per node)
- Host network access for system metrics
- Host PID access for process metrics
- Default port 9100 for metrics endpoint

## Metrics

Node Exporter exposes metrics at `:9100/metrics` including:

- **node_cpu_seconds_total**: CPU usage statistics
- **node_memory_MemAvailable_bytes**: Memory availability
- **node_filesystem_avail_bytes**: Filesystem availability
- **node_network_receive_bytes_total**: Network receive statistics
- **node_disk_io_time_seconds_total**: Disk I/O statistics

## Prometheus Integration

To scrape metrics with Prometheus, add this job configuration:

```yaml
scrape_configs:
  - job_name: node-exporter
    kubernetes_sd_configs:
      - role: pod
        namespaces:
          names:
            - monitoring
    relabel_configs:
      - source_labels: [__meta_kubernetes_pod_label_app_kubernetes_io_name]
        action: keep
        regex: prometheus-node-exporter
      - source_labels: [__meta_kubernetes_pod_ip]
        action: replace
        target_label: __address__
        regex: ([^:]+)(?::\d+)?;(\d+)
        replacement: $1:9100
```

## RBAC

Node Exporter requires appropriate permissions to access host-level metrics. The Helm chart creates the necessary ServiceAccount, ClusterRole, and ClusterRoleBinding.

## Uninstall

To uninstall Node Exporter:

```bash
make uninstall
```
