FROM openresty/openresty:1.15.8.1rc1-bionic
LABEL author="1141591465@qq.com"
WORKDIR /app
RUN  apt-get update && apt-get install -y wget \
    && wget -O  safaribooks-downloader https://github.com/rongfengliang/My-SafariBooks-Downloader/raw/master/safaribooks-downloader-linux \
    && chmod +x safaribooks-downloader
ENV PATH=$PATH:/app
