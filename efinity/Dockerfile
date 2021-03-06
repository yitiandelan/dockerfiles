FROM archlinux:base-devel

LABEL maintainer "yitiandelan@outlook.com"

ADD docker-entrypoint.sh /docker-entrypoint.sh

RUN chmod +x /docker-entrypoint.sh \
    && curl -sL "https://archlinux.org/mirrorlist/?country=CN&protocol=https" > /etc/pacman.d/mirrorlist \
    && sed -i -E "s/^#S/S/g" /etc/pacman.d/mirrorlist \
    && pacman -Syu --noconfirm sudo freetype2 fontconfig mesa libnsl harfbuzz krb5 libx11 qt5-base qt5-svg qt5-x11extras noto-fonts adobe-source-han-sans-cn-fonts \
    && pacman -Sc --noconfirm \
    && useradd --create-home tianlan \
    && echo "tianlan ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers \
    && curl https://www.efinixinc.com/dl/efinity-2020.2.299-rhe-x64.tar.bz2 | tar xjv -C /opt \
    && chown -R tianlan:tianlan /opt/efinity/2020.2 \
    && ln -s /opt/efinity/2020.2/bin/efinity /usr/bin/efinity

RUN pacman -Sy --noconfirm --need libffi protobuf boost-libs libxcursor libxtst libxrandr libxcomposite \
    nss tcl tbb expat glibc gtk2 libcanberra libpng libice libsm \
    util-linux ncurses zlib libxau libxdmcp libxext libxft libxrender libxt \
    && pacman -Sc --noconfirm

RUN pushd /opt/efinity \
    && ./bin/python3 -m compileall . \
    && popd

USER tianlan

WORKDIR /home/tianlan/work

VOLUME [ "/home/tianlan/work" ]

ENTRYPOINT [ "/docker-entrypoint.sh" ]

CMD [ "/opt/efinity/2020.2/bin/efinity_sh.sh" ]
