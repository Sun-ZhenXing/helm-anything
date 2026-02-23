# Prometheus Node Exporter

## 简介

Prometheus Node Exporter 是一个用于 *NIX 内核暴露的硬件和操作系统指标的 Prometheus 导出器。它从 Linux/Unix 系统收集系统级指标，如 CPU、内存、磁盘和网络使用情况。

此 Helm Chart 将 Node Exporter 作为 DaemonSet 部署在 Kubernetes 上，确保在每个节点上运行一个实例来收集主机级指标。

## 安装

安装 Node Exporter：

```bash
make install
```

## 使用

安装完成后：

```bash
# 检查 Node Exporter pod 是否在所有节点上运行
kubectl get pods -n monitoring -l app.kubernetes.io/name=prometheus-node-exporter

# 查看指标
curl http://<node-ip>:9100/metrics
```

## 配置

默认配置包括：

- DaemonSet 部署（每个节点一个 pod）
- 用于系统指标的主机网络访问
- 用于进程指标的主机 PID 访问
- 指标端点的默认端口 9100

## 指标

Node Exporter 在 `:9100/metrics` 暴露的指标包括：

- **node_cpu_seconds_total**: CPU 使用统计
- **node_memory_MemAvailable_bytes**: 内存可用性
- **node_filesystem_avail_bytes**: 文件系统可用性
- **node_network_receive_bytes_total**: 网络接收统计
- **node_disk_io_time_seconds_total**: 磁盘 I/O 统计

## Prometheus 集成

要使用 Prometheus 抓取指标，请添加此作业配置：

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

Node Exporter 需要适当的权限来访问主机级指标。Helm Chart 会创建必要的 ServiceAccount、ClusterRole 和 ClusterRoleBinding。

## 卸载

卸载 Node Exporter：

```bash
make uninstall
```
