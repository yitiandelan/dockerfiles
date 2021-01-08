FROM archlinux:base-devel

LABEL maintainer "yitiandelan@outlook.com"

RUN curl -sL "https://archlinux.org/mirrorlist/?country=CN&protocol=https" > /etc/pacman.d/mirrorlist \
    && sed -i -E "s/^#S/S/g" /etc/pacman.d/mirrorlist \
    && pacman -Syu --noconfirm --needed \
    && echo '[multilib]' >> /etc/pacman.conf \
    && echo 'Include = /etc/pacman.d/mirrorlist' >> /etc/pacman.conf \
    && pacman -Sy --noconfirm --needed noto-fonts adobe-source-han-sans-cn-fonts freetype2 fontconfig \
    && pacman -Sy --noconfirm --needed lib32-expat lib32-fontconfig lib32-freetype2 lib32-glibc lib32-gtk2 \
        lib32-libcanberra lib32-libpng lib32-libice lib32-libsm lib32-util-linux lib32-ncurses lib32-zlib \
        lib32-libx11 lib32-libxau lib32-libxdmcp lib32-libxext lib32-libxft lib32-libxrender lib32-libxt lib32-libxtst \
    && pacman -Sc --noconfirm \
    && useradd --create-home tianlan \
    && echo "tianlan ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

USER tianlan

RUN export workdir="/work" \
    && sudo mkdir $workdir \
    && sudo chown tianlan:tianlan $workdir \
    && sudo pacman -Sy --noconfirm --needed git libpng12 tcl lsb-release \
    && pushd $workdir \
    && git clone https://aur.archlinux.org/tcllib.git \
    && pushd tcllib \
    && sudo -u tianlan makepkg -sci --noconfirm \
    && popd \
    && git clone https://aur.archlinux.org/quartus-standard.git quartus \
    && pushd quartus \
    && git checkout -b makepkg 4ba699b \
    && sudo -u tianlan makepkg -sci --noconfirm \
    && cd / \
    && sudo rm -rf $workdir \
    && sudo pacman -Sc --noconfirm
