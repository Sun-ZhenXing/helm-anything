# vCluster

## 简介

vCluster（虚拟集群）是一个开源工具，允许您在另一个 Kubernetes 集群的命名空间中创建和管理功能完整的 Kubernetes 集群。与单独的物理集群相比，它提供了强大的隔离性、减少的运营开销和更好的资源利用率。

## 功能

- **轻量级**: 无需单独控制平面的开销即可运行隔离的 Kubernetes 集群
- **强隔离**: 每个 vCluster 都有自己的 API server 和控制平面
- **成本效益**: 共享基础设施同时保持隔离
- **RBAC 和网络策略**: 完全支持原生 Kubernetes 安全功能
- **持久化存储**: 支持持久卷和存储类
- **多租户**: 适用于开发、测试和 CI/CD 流水线

## 前置条件

- 一个正常工作的 Kubernetes 集群（主机集群）
- 配置了 kubectl 以访问主机集群
- 配置了默认 StorageClass（用于持久化工作负载）

## 安装

安装 vCluster：

```bash
make install
```

## 使用

### 创建虚拟集群

安装 vCluster 后，创建虚拟集群：

```bash
# 创建一个名为 'my-vcluster' 的虚拟集群
vcluster create my-vcluster

# 或指定命名空间
vcluster create my-vcluster -n vcluster
```

### 连接到虚拟集群

```bash
# 连接到虚拟集群（更新 kubeconfig）
vcluster connect my-vcluster

# 或不切换的情况下获取 kubeconfig
vcluster connect my-vcluster --update-current=false
```

### 列出虚拟集群

```bash
vcluster list
```

### 删除虚拟集群

```bash
vcluster delete my-vcluster
```

## vCluster CLI 安装

安装 vCluster CLI 工具：

```bash
# macOS
curl -L -o vcluster "https://github.com/loft-sh/vcluster/releases/latest/download/vcluster-darwin-amd64" && chmod +x vcluster && sudo mv vcluster /usr/local/bin

# Linux
curl -L -o vcluster "https://github.com/loft-sh/vcluster/releases/latest/download/vcluster-linux-amd64" && chmod +x vcluster && sudo mv vcluster /usr/local/bin

# Windows (PowerShell)
md -Force "$Env:APPDATA\vcluster"; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.SecurityProtocolType]'Tls,Tls11,Tls12'; Invoke-WebRequest -URI "https://github.com/loft-sh/vcluster/releases/latest/download/vcluster-windows-amd64.exe" -outfile "$Env:APPDATA\vcluster\vcluster.exe"; $env:Path += ";" + $Env:APPDATA + "\vcluster"; [Environment]::SetEnvironmentVariable("Path", $env:Path, [EnvironmentVariableTarget]::User);
```

## 存储

vCluster 支持：

- **临时存储**: vCluster 删除时数据丢失
- **持久化存储**: 对持久化工作负载使用 PVC
- **HostPath**: 直接访问主机节点存储（不推荐用于生产环境）

## 网络

vCluster 在主机集群中创建隔离的网络：

- 每个 vCluster 都有自己的 ClusterIP 服务
- 可以配置 Ingress 将流量路由到 vCluster 服务
- 可以使用网络策略进行额外的隔离

## 配置

编辑 `values.yaml` 以配置：

- vCluster 版本（Kubernetes 版本）
- 资源限制
- 存储后端
- 同步资源
- 隔离设置

## vCluster Platform（可选）

对于额外的功能，如 UI、多集群管理和高级网络：

```bash
helm upgrade vcluster-platform vcluster-platform \
  --install \
  --repo https://charts.loft.sh \
  --namespace vcluster-platform \
  --create-namespace
```

## 重要提示

1. vCluster 创建轻量级、隔离的 Kubernetes 集群
2. 主机集群必须有足够的资源
3. 考虑使用 vCluster Platform 获取企业级功能
4. 持久化存储需要正确的 StorageClass 配置
5. 网络策略可以增强 vCluster 之间的隔离
