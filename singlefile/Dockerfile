FROM zenika/alpine-chrome:with-node

USER root

RUN git clone --depth 1 --recursive https://github.com/gildas-lormeau/SingleFile.git \
    && rm -rf SingleFile/.git \
    && cd SingleFile \
    && npm install --production \
    && cd cli \
    && npm install --production \
    && chmod +x single-file

FROM zenika/alpine-chrome:with-node

LABEL maintainer "yitiandelan@outlook.com"

ENV APP_ROOT /usr/src/app

COPY --from=0 ${APP_ROOT}/SingleFile ${APP_ROOT}/SingleFile

USER root

RUN mkdir -p -m 755 /data \
    && chown -R chrome:chrome ${APP_ROOT} \
    && ln -s ${APP_ROOT}/SingleFile/cli/single-file /usr/bin/single-file \
    && chmod +x /usr/bin/single-file

USER chrome

WORKDIR /data

VOLUME /data

ENTRYPOINT ["single-file", "--browser-executable-path", "/usr/bin/chromium-browser", "--browser-args", "[\"--no-sandbox\"]"]

CMD ["--help"]
