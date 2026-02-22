# K3k

## 简介

K3k（Kubernetes in Kubernetes）是一个工具，让您能够在现有 Kubernetes 环境中创建和管理隔离的 K3s 集群。它实现了高效的多租户、简化的实验环境和强大的资源隔离，通过在同一物理主机上运行多个轻量级 Kubernetes 集群来最小化基础设施成本。

## 功能

- **共享模式**: 通过共享底层资源优化资源利用率
- **虚拟模式**: 使用专用 K3s server pod 实现完全隔离
- **Rancher 集成**: 与 Rancher 无缝集成以简化集群管理
- **资源隔离**: 为每个嵌入式集群定义资源限制和配额
- **轻量级**: 利用 K3s 的轻量级特性实现快速集群配置

## 前置条件

- 一个正常工作的 Kubernetes 集群（主机集群）
- 配置了存储提供商（或使用临时/静态存储）
- 配置了 kubectl 以访问主机集群

## 安装

安装 K3k 控制器：

```bash
make install
```

## 使用

### 安装 k3kcli（可选）

下载并安装 k3k CLI 工具：

```bash
# Linux amd64
wget -qO k3kcli https://github.com/rancher/k3k/releases/latest/download/k3kcli-linux-amd64
chmod +x k3kcli
sudo mv k3kcli /usr/local/bin
```

### 创建 K3k 集群

使用 k3kcli：

```bash
k3kcli cluster create my-cluster
```

使用 kubectl（创建 Cluster CR）：

```bash
cat <<EOF | kubectl apply -f -
apiVersion: k3k.io/v1alpha1
kind: Cluster
metadata:
  name: my-cluster
  namespace: k3k
spec:
  mode: shared
  servers: 1
  agents: 0
  version: v1.28.4+k3s1
EOF
```

### 获取集群 Kubeconfig

```bash
# 使用 k3kcli
k3kcli kubeconfig generate --name my-cluster --namespace k3k

# 或直接从 secret 获取
kubectl get secret my-cluster-kubeconfig -n k3k -o jsonpath='{.data.value}' | base64 -d > my-cluster.yaml
```

### 删除 K3k 集群

```bash
# 使用 k3kcli
k3kcli cluster delete my-cluster

# 或使用 kubectl
kubectl delete cluster my-cluster -n k3k
```

## 集群模式

### 共享模式

- Server 组件作为 pod 运行在主机集群中
- 高效的资源共享
- 适用于开发和测试

### 虚拟模式

- 每个集群都有专用的 K3s server pod
- 完整的网络和资源隔离
- 适用于多租户环境

## 配置

编辑 `values.yaml` 以配置：

- 控制器资源
- 功能门
- 镜像版本
- RBAC 设置

## 重要提示

1. K3k 在现有集群中创建虚拟 Kubernetes 集群
2. 主机集群必须有足够的资源来运行虚拟集群
3. 持久化工作负载必须有可用的存储类
4. 考虑使用网络策略来实现虚拟集群之间的隔离
