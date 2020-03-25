FROM malexandre/gae:python

# TODO: [gcloud](https://cloud.google.com/appengine/docs/standard/python/quickstart)

RUN echo "https://mirrors.ustc.edu.cn/alpine/v3.5/main" > /etc/apk/repositories \
    && apk add --update --no-cache git \
    && mkdir -p /code && cd /code \
    && git clone --depth 1 https://github.com/sympy/sympy-live.git \
    && cd sympy-live \
    && git checkout bcec8835 \
    && sed -i -E 's/git[:\/@]+/https:\/\//g' .gitmodules \
    && sed -i 's/com:/com\//g' .gitmodules \
    && sed -i 's/\.git//g' .gitmodules

RUN git submodule update --init --depth 1 \
    && rm -rf .git

FROM malexandre/gae:python

LABEL maintainer "yitiandelan@outlook.com"

COPY --from=0 /code/sympy-live /code/sympy-live

EXPOSE 8080

ENTRYPOINT ["dev_appserver.py"]

CMD ["--host=0.0.0.0", "--skip_sdk_update_check=yes", "sympy-live"]
