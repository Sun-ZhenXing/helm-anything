# Rainbond

## 简介

Rainbond 是一个云原生应用管理平台，可以轻松地在 Kubernetes 上部署、管理和扩展应用程序。它提供了一个完整的 PaaS（平台即服务）解决方案，包括：

- **应用管理**：轻松部署和管理应用程序生命周期
- **服务网格**：内置服务发现和流量管理
- **多租户**：支持多个团队和用户
- **CI/CD 集成**：自动化构建和部署流水线
- **应用市场**：预构建的应用模板和组件

## 安装

要安装 Rainbond，请运行：

```bash
make install
```

这将在 `rbd-system` 命名空间中部署 Rainbond。

## 使用

安装完成后，验证部署状态：

```bash
kubectl get pods -n rbd-system
```

要访问 Rainbond 控制台，您需要获取网关 IP：

```bash
kubectl get pod -n rbd-system -l name=rbd-gateway -o wide
```

然后访问：`http://<GATEWAY_NODE_IP>:7070`

如果您配置了 ingress：

```bash
kubectl get ingress -n rbd-system
```

## 配置

您可以通过修改 `values.yaml` 文件来自定义安装：

- `Cluster.gatewayIngressIPs`：设置网关入口 IP
- `Cluster.nodesForGateway`：配置网关节点
- `pvc.storageClassName`：设置 PVC 的存储类
- `resources`：配置资源限制和请求

## 卸载

要卸载 Rainbond：

```bash
make uninstall
```

## 文档

更多信息请参阅官方文档：

- [Rainbond 文档](https://www.rainbond.com/docs/)
- [Helm Chart 仓库](https://github.com/goodrain/rainbond-chart)
