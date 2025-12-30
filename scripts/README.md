# Valkey Docker Image for ACR

Valkey (Redis fork) Docker image configured for Alibaba Cloud ACR.

## Quick Start

```bash
# Pull from ACR
docker pull registry.cn-hangzhou.aliyuncs.com/YOUR_NAMESPACE/valkey:7.2

# Run container
docker run -d \
  --name valkey \
  -e VALKEY_PASSWORD=your_password \
  -p 6379:6379 \
  registry.cn-hangzhou.aliyuncs.com/YOUR_NAMESPACE/valkey:7.2

Features
Based on Valkey 7.2 (Redis fork)

Alpine Linux for small image size

Configurable via environment variables

Health check enabled

Timezone set to Asia/Shanghai

Environment Variables
VALKEY_PASSWORD: Authentication password

VALKEY_MAXMEMORY: Maximum memory limit


#### 创建 .dockerignore：
```gitignore
# Ignore
.dockerignore
.git
.gitignore
*.md
*.txt
