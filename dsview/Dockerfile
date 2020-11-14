FROM archlinux

RUN curl "https://www.archlinux.org/mirrorlist/?country=CN&protocol=https" > /etc/pacman.d/mirrorlist \
    && sed -i -E "s/^#S/S/g" /etc/pacman.d/mirrorlist \
    && pacman -Syu --noconfirm --needed sudo git base-devel go \
    && pacman -Sc --noconfirm \
    && useradd --create-home tianlan \
    && echo "tianlan ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers \
    && mkdir -p /workdir \
    && chown -R tianlan:tianlan /workdir

USER tianlan

RUN pushd /workdir \
    && git clone https://aur.archlinux.org/libsigrok4dsl.git \
    && pushd libsigrok4dsl \
    && sudo -u tianlan makepkg -sci --noconfirm \
    && popd \
    && git clone https://aur.archlinux.org/libsigrokdecode4dsl.git \
    && pushd libsigrokdecode4dsl \
    && sudo -u tianlan makepkg -sci --noconfirm \
    && popd \
    && git clone https://aur.archlinux.org/dsview.git \
    && pushd dsview \
    && makepkg -sc --noconfirm \
    && popd \
    && mv */*.pkg.tar.zst . \
    && rm -rf libsigrok4dsl libsigrokdecode4dsl dsview

FROM archlinux

LABEL maintainer "yitiandelan@outlook.com"

COPY --from=0 /workdir /workdir

RUN curl "https://www.archlinux.org/mirrorlist/?country=CN&protocol=https" > /etc/pacman.d/mirrorlist \
    && sed -i -E "s/^#S/S/g" /etc/pacman.d/mirrorlist \
    && pacman -Syu --noconfirm --needed sudo noto-fonts adobe-source-han-sans-cn-fonts qt5-svg \
    && useradd --create-home tianlan \
    && echo "tianlan ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers \
    && pacman -U --noconfirm --needed /workdir/*.pkg.tar.zst \
    && pacman -Sc --noconfirm \
    && rm -rf /workdir

USER tianlan

CMD [ "/usr/bin/dsview" ]
