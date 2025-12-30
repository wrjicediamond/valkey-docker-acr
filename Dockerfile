# 使用官方Valkey镜像
FROM valkey/valkey:7.2-alpine

# 设置维护者信息
LABEL maintainer="your-name"
LABEL version="1.0"
LABEL description="Valkey (Redis fork) Docker image for ACR"

# 设置时区
RUN apk add --no-cache tzdata && \
    cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
    echo "Asia/Shanghai" > /etc/timezone && \
    apk del tzdata

# 复制配置文件
COPY valkey.conf /usr/local/etc/valkey/

# 复制自定义脚本
COPY scripts/entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/entrypoint.sh

# 创建数据目录
RUN mkdir -p /data && chown -R valkey:valkey /data

# 健康检查
HEALTHCHECK --interval=30s --timeout=10s --start-period=30s --retries=3 \
    CMD valkey-cli ping || exit 1

# 暴露端口
EXPOSE 6379

# 使用自定义entrypoint
ENTRYPOINT ["entrypoint.sh"]
CMD ["valkey-server", "/usr/local/etc/valkey/valkey.conf"]
