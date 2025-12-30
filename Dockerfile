# 使用Valkey官方镜像（Redis分支）
FROM valkey/valkey:7.2-alpine

# 设置维护者信息
LABEL maintainer="wrjicediamond"
LABEL version="1.0"
LABEL description="Valkey (Redis compatible) Docker image for ACR"

# 设置时区为上海
RUN apk add --no-cache tzdata && \
    cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
    echo "Asia/Shanghai" > /etc/timezone && \
    apk del tzdata

# 复制配置文件
COPY config/valkey.conf /usr/local/etc/valkey/

# 健康检查
HEALTHCHECK --interval=30s --timeout=10s --start-period=30s --retries=3 \
    CMD valkey-cli ping || exit 1

# 暴露端口
EXPOSE 6379

# 使用官方entrypoint
CMD ["valkey-server", "/usr/local/etc/valkey/valkey.conf"]
