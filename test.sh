#!/bin/zsh

set -x

# 删除测试镜像
docker rmi test

# 清除多余文件 增加COPY时的效率
hexo clean

# 编译镜像
docker build . -t test

# 运行站点
docker run --rm --name devblog -p 80:80 test
