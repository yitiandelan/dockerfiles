# Resilio Sync
#
# VERSION               0.1
#

FROM alpine:3.7

LABEL maintainer "support@resilio.com"
LABEL com.resilio.version="2.6.4"

ENV APP_VERSION 2.6.4

RUN echo "https://mirrors.ustc.edu.cn/alpine/v3.5/main" > /etc/apk/repositories \
    && apk add --update --no-cache bash curl \
    && rm -rf /var/cache/apk/* \
    && curl -sL https://download-cdn.resilio.com/${APP_VERSION}/linux-x64/resilio-sync_x64.tar.gz | tar -xz -C /usr/bin rslsync \
    && curl -sL https://raw.githubusercontent.com/bt-sync/sync-docker/master/sync.conf.default -o /etc/sync.conf.default \
    && curl -sL https://raw.githubusercontent.com/bt-sync/sync-docker/master/run_sync -o /usr/bin/run_sync \
    && chmod +x /usr/bin/run_sync

# webui port
EXPOSE 8888/tcp

# listening port
EXPOSE 55555/tcp

# listening port
EXPOSE 55555/udp

# More info about ports used by Sync you can find here:
# https://help.resilio.com/hc/en-us/articles/204754759-What-ports-and-protocols-are-used-by-Sync-

VOLUME /mnt/sync

CMD ["run_sync", "--config", "/mnt/sync/sync.conf"]
