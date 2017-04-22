FROM armhf/alpine
MAINTAINER Simon Erhardt <hello@rootlogin.ch>

ARG NEXTCLOUD_GPG="2880 6A87 8AE4 23A2 8372  792E D758 99B9 A724 937A"
ARG NEXTCLOUD_VERSION=11.0.2
ARG UID=1501
ARG GID=1501

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories && \
  apk add --update \
  bash \
  gnupg \
  nginx \
  openssl \
  php5 \
  php5-apcu \
  php5-bz2 \
  php5-ctype \
  php5-curl \
  php5-dom \
  php5-exif \
  php5-fpm \
  php5-ftp \
  php5-gd \
  php5-gmp \
  php5-iconv \
  php5-imap \
  php5-intl \
  php5-json \
  php5-ldap \
  php5-mcrypt \
  php5-openssl \
  php5-opcache \
  php5-pcntl \
  php5-phar \
  php5-posix \
  php5-pdo_mysql \
  php5-pdo_sqlite \
  php5-pdo_pgsql \
  php5-pgsql \
  php5-sqlite3 \
  php5-xml \
  php5-xmlreader \
  php5-zip \
  php5-zlib \
  rsync \
  sudo \
  supervisor \
  tar \
  wget \
  tini \
  ffmpeg \
  && rm -rf /var/cache/apk/* \
  && addgroup -g ${GID} nextcloud \
  && adduser -u ${UID} -h /opt/nextcloud -H -G nextcloud -s /sbin/nologin -D nextcloud

COPY bin/run.sh /usr/local/bin/run.sh
COPY bin/occ /usr/local/bin/occ
COPY etc/supervisord.conf /etc/supervisord.conf
COPY etc/php-fpm.conf /etc/php5/php-fpm.conf
COPY etc/nginx/nginx.conf /etc/nginx/nginx.conf
COPY etc/nginx/fastcgi_params /etc/nginx/fastcgi_params
COPY etc/php/apcu.ini /etc/php5/fpm/conf.d/apcu.ini
COPY etc/cron /etc/periodic/15min/nextcloud
RUN chmod +x /usr/local/bin/run.sh /usr/local/bin/occ /etc/periodic/15min/nextcloud

VOLUME ["/data"]

RUN mkdir -p /opt/nextcloud \
 && cd /tmp \
 && NEXTCLOUD_TARBALL="nextcloud-${NEXTCLOUD_VERSION}.tar.bz2" \
 && wget https://download.nextcloud.com/server/releases/${NEXTCLOUD_TARBALL} \
 && tar xjf ${NEXTCLOUD_TARBALL} --strip-components=1 -C /opt/nextcloud \
 && rm -rf /tmp/* /root/.gnupg

COPY etc/nextcloud/docker.config.php /opt/nextcloud/config/docker.config.php

EXPOSE 80

ENTRYPOINT ["/sbin/tini", "--"]
CMD ["/usr/local/bin/run.sh"]
