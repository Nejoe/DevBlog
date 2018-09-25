#!/bin/zsh

set -x

# 生成站点
hexo clean
# hexo generate

# 编译镜像
docker build --no-cache . -t test

# 运行站点
docker run --rm --name devblog -p 80:80 test

# 删除镜像
echo "准备删除镜像"
sleep 3
docker rmi test