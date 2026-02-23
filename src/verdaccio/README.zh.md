# Verdaccio

## 简介

Verdaccio 是一个用 Node.js 构建的轻量级私有 npm 代理 registry。它允许您拥有零配置的本地 npm registry，并提供以下功能：

- 私有包托管
- 代理到 npmjs.org（缓存）
- 本地存储供离线访问
- 支持认证和存储插件

此 Helm Chart 在 Kubernetes 上部署 Verdaccio，用于托管私有 npm 包。

## 安装

安装 Verdaccio：

```bash
make install
```

## 使用

安装完成后：

```bash
# 端口转发以访问 Verdaccio
kubectl port-forward svc/verdaccio -n verdaccio 4873:4873
```

然后配置 npm 以使用您的私有 registry：

```bash
# 设置 registry
npm set registry http://localhost:4873

# 登录（如果启用了认证）
npm adduser --registry http://localhost:4873

# 发布包
npm publish

# 安装包
npm install
```

## 配置

默认配置包括：

- 匿名访问读取包
- 代理到 npmjs.org 获取本地找不到的包
- 本地文件系统存储
- 启用基本 Web 界面

## 存储

为生产环境启用持久存储：

```yaml
persistence:
  enabled: true
  size: 10Gi
```

## 认证

在 config.yaml 中启用认证：

```yaml
auth:
  htpasswd:
    file: /verdaccio/conf/htpasswd
    max_users: 1000
```

## 上行链路配置

配置多个上行链路用于包代理：

```yaml
uplinks:
  npmjs:
    url: https://registry.npmjs.org/
  yarn:
    url: https://registry.yarnpkg.com
```

## 包访问

配置包访问权限：

```yaml
packages:
  '@mycompany/*':
    access: $authenticated
    publish: $authenticated
```

## 卸载

卸载 Verdaccio：

```bash
make uninstall
```
