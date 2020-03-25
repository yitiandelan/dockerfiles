FROM alpine:3.7

RUN echo "https://mirrors.ustc.edu.cn/alpine/v3.7/main" > /etc/apk/repositories \
    && apk add --update --no-cache bash curl unzip \
    && curl -SL https://install.direct/go.sh | bash

EXPOSE 1080

CMD ["/usr/bin/v2ray/v2ray", "-c", "/etc/v2ray/config.json"]
