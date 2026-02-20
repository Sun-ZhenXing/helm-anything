# Jenkins

## 简介

Jenkins 是一个开源自动化服务器，使开发人员能够可靠地构建、测试和部署软件。它支持数千个插件，用于各种 CI/CD 流水线。

## 安装

安装 Jenkins：

```bash
make install
```

## 使用

安装完成后，访问 Jenkins：

```bash
# 端口转发以访问 Jenkins
kubectl port-forward svc/jenkins -n jenkins 8080:8080

# 获取管理员密码
kubectl get secret jenkins -n jenkins -o jsonpath="{.data.jenkins-admin-password}" | base64 -d
```

然后打开 <http://localhost:8080> 完成设置向导。

## 配置

默认配置包括：

- 预装 Kubernetes、Git、Pipeline 和 Blue Ocean 插件
- 1 个控制器副本，内存限制 2Gi
- 1Gi 持久卷用于构建数据
- 启用配置即代码 (CasC)

## 已安装插件

- kubernetes - Kubernetes 动态代理插件
- workflow-aggregator - Pipeline 插件套件
- git - Git 集成
- configuration-as-code - CasC 支持
- blue-ocean - 现代化 UI
- docker-workflow - Docker 流水线支持
- pipeline-stage-view - 流水线可视化

## 自定义

自定义 Jenkins：

1. 编辑 `values.yaml` 添加更多插件
2. 配置 CasC 脚本用于预配置任务
3. 根据工作负载调整资源限制
