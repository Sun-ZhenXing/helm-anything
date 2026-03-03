# OpenSandbox

## 简介

OpenSandbox 是阿里巴巴开发的沙箱解决方案，为运行应用程序提供安全、隔离的环境。它使用户能够创建和管理具有细粒度资源控制和安全策略的沙箱工作负载。

## 安装

要安装 OpenSandbox，请运行：

```bash
make install
```

这将：

1. 从 GitHub Release 下载 OpenSandbox Helm Chart（版本 0.1.0）
2. 在 `opensandbox-system` 命名空间中安装 OpenSandbox 控制器
3. 如果命名空间不存在，则自动创建

## 使用

安装后，验证部署：

```bash
kubectl get pods -n opensandbox-system
```

查看控制器日志：

```bash
kubectl logs -n opensandbox-system -l app=opensandbox-controller
```

## 版本信息

- **Chart 版本:** 0.1.0
- **应用版本:** 0.1.0
- **控制器镜像:** `sandbox-registry.cn-zhangjiakou.cr.aliyuncs.com/opensandbox/controller:v0.1.0`
- **发布日期:** 2026-03-03

## 卸载

要卸载 OpenSandbox：

```bash
make uninstall
```
