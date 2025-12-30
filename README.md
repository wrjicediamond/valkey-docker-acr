# Valkey for ACR
```bash
docker pull registry.cn-hangzhou.aliyuncs.com/YOUR_NAMESPACE/valkey:7.2

## 第二部分：配置ACR连接GitHub

### 2.1 授权ACR访问GitHub
1. 登录 [阿里云ACR控制台](https://cr.console.aliyun.com)
2. 点击「创建镜像仓库」
3. 在代码源部分，点击「GitHub」→「前往授权」
4. 在GitHub授权页面点击「Authorize aliyuncontainerservice」
5. 授权成功后返回ACR

### 2.2 创建镜像仓库
填写仓库信息：
仓库名称：valkey
仓库类型：私有
摘要：Valkey (Redis compatible) Docker image
仓库地址：选择默认实例（如registry.cn-hangzhou.aliyuncs.com）
代码源：GitHub
命名空间：选择 wrjicediamond（你的GitHub用户名）
代码仓库：选择 valkey-acr-build
默认分支：main
构建目录：留空（仓库根目录）
Dockerfile路径：Dockerfile
镜像版本：7.2


点击「确定」保存

## 第三部分：触发构建和验证

### 3.1 立即触发首次构建
1. 在构建规则页面点击「立即构建」
2. 选择分支：`main`
3. 点击「确定」

### 3.2 查看构建日志
等待构建完成，查看日志确认成功：
#1 FROM valkey/valkey:7.2-alpine
#2 RUN apk add --no-cache tzdata...
#3 COPY config/valkey.conf...


### 3.3 验证镜像已创建
1. 返回仓库首页
2. 点击「镜像版本」
3. 看到标签为「7.2」的Valkey镜像

## 第四部分：使用Valkey镜像（类似MySQL使用）

### 4.1 从ACR拉取镜像
```bash
# 登录ACR（如果需要）
docker login --username=你的ACR用户名 registry.cn-hangzhou.aliyuncs.com

# 拉取Valkey镜像
docker pull registry.cn-hangzhou.aliyuncs.com/你的命名空间/valkey:7.2
