FROM alpine:3.7

LABEL maintainer "yitiandelan@outlook.com"

ENV APP_ROOT /code
ENV APP_VERSION 0.29.4

RUN echo "https://mirrors.ustc.edu.cn/alpine/v3.5/main" > /etc/apk/repositories \
    && apk add --update --no-cache curl python3-dev gcc g++ libc-dev \
    && rm -rf /var/cache/apk/*

RUN curl -sL https://github.com/aploium/zmirror/archive/v${APP_VERSION}.tar.gz | tar -xz -C / \
    && mkdir -p ${APP_ROOT} \
    && mv /zmirror-${APP_VERSION} ${APP_ROOT}/zmirror \
    && cd ${APP_ROOT}/zmirror \
    && pip3 config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple \
    && pip3 install --no-cache-dir -r requirements.txt \
    && pip3 install gunicorn \
    && cat more_configs/config_google_and_zhwikipedia.py > config.py

WORKDIR ${APP_ROOT}/zmirror

EXPOSE 80

CMD ["gunicorn", "--bind", "0.0.0.0:80", "--workers", "2", "--worker-connections", "100", "wsgi:application"]
