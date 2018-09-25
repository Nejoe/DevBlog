## 
# Node 编译镜像
## 

FROM node:latest AS build-env
# 创建hexo-blog文件夹且设置成工作文件夹
RUN mkdir -p /usr/src/hexo-blog
WORKDIR /usr/src/hexo-blog
# 复制当前所有文件到编译容器中
COPY . .
# 安装 hexo-cli
RUN npm install hexo-cli -g && npm install
# 生成静态文件
RUN hexo clean && hexo g

##
# nginx 部署
##

FROM nginx:alpine
# 切换时区
# ENV TZ=Asia/Shanghai
# RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# 拷贝静态文件
COPY --from=build-env /usr/src/hexo-blog/public /usr/share/nginx/html