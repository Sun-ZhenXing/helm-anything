# Nexus Repository Manager

## 简介

Nexus Repository Manager 是一个强大的制品仓库管理器，支持多种格式，包括 Maven、npm、NuGet、Docker 等。它充当存储和管理软件制品的中心枢纽。

## 安装

安装 Nexus：

```bash
make install
```

## 使用

安装完成后，访问 Nexus：

```bash
# 端口转发以访问 Nexus
kubectl port-forward svc/nexus-repository-manager -n nexus 8081:8081
```

然后在浏览器中打开 <http://localhost:8081>。

默认凭据：

- 用户名：`admin`
- 密码：从 Pod 获取

```bash
# 获取管理员密码
kubectl exec -it deployment/nexus-repository-manager -n nexus -- cat /nexus-data/admin.password
```

## 配置

默认配置包括：

- 100Gi 持久化存储用于制品
- 4Gi 内存限制
- 单副本部署
- JVM 堆大小：2g

## 仓库类型

Nexus 支持多种仓库格式：

- **Maven** (Java 制品)
- **npm** (Node.js 包)
- **NuGet** (.NET 包)
- **Docker** (容器镜像)
- **PyPI** (Python 包)
- **Raw** (通用文件)
- **Yum/APT** (Linux 包)

## Docker 仓库

启用 Docker 仓库支持：

1. 编辑 `values.yaml` 设置 `nexus.docker.enabled: true`
2. 配置带端口的仓库
3. 通过 NodePort 或 Ingress 暴露

## 备份

建议启用定时备份：

1. 配置 `backup.enabled: true`
2. 设置备份计划和存储
