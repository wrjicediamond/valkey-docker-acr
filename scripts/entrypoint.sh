#!/bin/sh
set -e

# 如果设置了密码，更新配置文件
if [ -n "$VALKEY_PASSWORD" ]; then
    sed -i "s/requirepass .*/requirepass $VALKEY_PASSWORD/" /usr/local/etc/valkey/valkey.conf
fi

# 如果设置了内存限制
if [ -n "$VALKEY_MAXMEMORY" ]; then
    sed -i "s/maxmemory .*/maxmemory $VALKEY_MAXMEMORY/" /usr/local/etc/valkey/valkey.conf
fi

# 执行原始命令
exec "$@"
