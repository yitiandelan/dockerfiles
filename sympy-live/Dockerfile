FROM malexandre/gae:python

# TODO: [gcloud](https://cloud.google.com/appengine/docs/standard/python/quickstart)

RUN echo "https://mirrors.ustc.edu.cn/alpine/v3.5/main" > /etc/apk/repositories \
    && apk add --update --no-cache git openssh-client \
    && mkdir -p /code && cd /code \
    && git clone --depth 1 --recursive https://github.com/sympy/sympy-live.git \
    && rm -rf sympy-live/.git

FROM malexandre/gae:python

LABEL maintainer "yitiandelan@outlook.com"

COPY --from=0 /code/sympy-live /code

EXPOSE 8080

ENTRYPOINT ["dev_appserver.py"]

CMD ["--host", "0.0.0.0", "--skip_sdk_update_check=yes", "/code/sympy-live/app.yaml"]
