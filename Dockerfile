FROM openresty/openresty:1.15.8.1rc1-0-alpine-fat
LABEL author="1141591465@qq.com"
WORKDIR /app
RUN apk add libstdc++ libgcc \
    && wget -O  safaribooks-downloader https://github.com/rongfengliang/My-SafariBooks-Downloader/raw/master/safaribooks-downloader-linux \
    && chmod +x safaribooks-downloader
ENV PATH=$PATH:/app