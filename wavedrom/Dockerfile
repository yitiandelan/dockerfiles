FROM archlinux:base-devel

LABEL maintainer "yitiandelan@outlook.com"

RUN curl -sL "https://archlinux.org/mirrorlist/?country=CN&protocol=https" > /etc/pacman.d/mirrorlist \
    && sed -i -E "s/^#S/S/g" /etc/pacman.d/mirrorlist \
    && pacman -Syu --noconfirm --needed nodejs-lts-dubnium npm \
    && useradd --create-home tianlan \
    && echo "tianlan ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers \
    && pacman -Sc --noconfirm

USER tianlan

RUN sudo npm -g --unsafe-perm install wavedrom-cli \
    && sudo mkdir -p /workdir \
    && sudo chown -R tianlan:tianlan /workdir

WORKDIR /workdir

VOLUME /workdir

ENTRYPOINT [ "/usr/bin/node", "/usr/lib/node_modules/wavedrom-cli/wavedrom-cli.js" ]

CMD [ "--help" ]
