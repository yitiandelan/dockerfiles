FROM archlinux:base-devel

LABEL maintainer "yitiandelan@outlook.com"

RUN curl -sL "https://archlinux.org/mirrorlist/?country=CN&protocol=https" > /etc/pacman.d/mirrorlist \
    && sed -i -E "s/^#S/S/g" /etc/pacman.d/mirrorlist \
    && pacman -Syu --noconfirm python2 \
    && pacman -Sc --noconfirm \
    && useradd --create-home tianlan \
    && echo "tianlan ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers \
    && mkdir -p /opt \
    && curl https://codeload.github.com/adrianf0/hdlregs/tar.gz/master | tar xz -C /opt \
    && mv /opt/hdlregs-master /opt/hdlregs

USER tianlan

ADD docker-entrypoint.sh /docker-entrypoint.sh

RUN sudo chmod +x /docker-entrypoint.sh \
    && sudo mkdir -p /workdir \
    && sudo chown -R tianlan:tianlan /workdir

WORKDIR /workdir

VOLUME /workdir

ENTRYPOINT [ "/docker-entrypoint.sh" ]

CMD [ "-h" ]
