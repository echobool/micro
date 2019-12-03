#FROM golang:1.13-alpine as builder
#RUN apk --no-cache add make git gcc libtool musl-dev
#WORKDIR /
#COPY . /
#RUN make build

#FROM alpine:latest
#RUN apk --no-cache add ca-certificates && \
#    rm -rf /var/cache/apk/* /tmp/*
#COPY --from=builder /micro .
#ENTRYPOINT ["/micro"]


# 使用最新版 alpine 作为基础镜像
FROM alpine:latest

# 在容器的根目录下创建 app 目录
RUN apk add tzdata && cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && echo "Asia/Shanghai" > /etc/timezone \
    && apk del tzdata \
    && mkdir /app

# 将工作目录切换到 /app 下
WORKDIR /app

# 将微服务的服务端运行文件拷贝到 /app 下
ADD micro /app/micro

# 运行服务端
ENTRYPOINT ["./micro"]