FROM centos:6.8

LABEL \
    BASE_OS="CentOS 6.8" \
    DEFAULT_IMAGE="cbiit/python27" \
    DEFAULT_TAG="c6_source" \
    DESCRIPTION="CentOS 6.8 / Python 2.7.12" \
    VERSION="1.0" \
    UID="PYTHON27_C6_SOURCE"

RUN yum -y install \
    epel-release \
 && yum -y upgrade \
 && yum clean all

RUN yum -y install \

    autoconf \
    gcc-c++ \
    pkgconfig \
    bluez-libs-devel \
    bzip2 \
    bzip2-devel \
    expat-devel \
    findutils \
    gdbm-devel \
    glibc-devel \
    gmp-devel \
    libdb-devel \
    libffi-devel \
    libGL-devel \
    libX11-devel \
    ncurses-devel \
    openssl-devel \
    readline-devel \
    sqlite-devel \
    systemtap-sdt-devel \
    tar \
    tcl-devel \
    tix-devel \
    tk-devel \
    valgrind-devel \
    zlib-devel \
    
 ## Build python 2.7.12 from source

 && cd /tmp \
 && curl -O https://www.python.org/ftp/python/2.7.12/Python-2.7.12.tgz \
 && tar xf Python-2.7.12.tgz \
 && cd Python-2.7.12 \
 && ./configure  --enable-shared --prefix=/usr/local \
 && make \
 && make altinstall \
 && cd \
 && rm -rf /tmp/* \


 ## Remove build-time dependencies

 && yum -y remove \

    bluez-libs-devel \
    bzip2-devel \
    expat-devel \
    gdbm-devel \
    gmp-devel \
    libGL-devel \
    libX11-devel \
    openssl-devel \
    sqlite-devel \
    systemtap-sdt-devel \
    tcl-devel \
    tix-devel \
    tk-devel \
    valgrind-devel \
    zlib-devel \
    bluez-libs \
    cloog-ppl \
    fontconfig \
    fontconfig-devel \
    freetype \
    freetype-devel \
    glibc-headers \
    hwdata \
    initscripts \
    iproute \
    iptables \
    iputils \
    kernel-headers \
    keyutils-libs-devel \
    krb5-devel \
    libX11 \
    libX11-common \
    libXau \
    libXau-devel \
    libXdamage \
    libXdamage-devel \
    libXext \
    libXext-devel \
    libXfixes \
    libXfixes-devel \
    libXft \
    libXft-devel \
    libXrender \
    libXrender-devel \
    libXxf86vm \
    libXxf86vm-devel \
    libcom_err-devel \
    libdrm \
    libdrm-devel \
    libgomp \
    libpciaccess \
    libselinux-devel \
    libsemanage \
    libsepol-devel \
    libstdc++-devel \
    libxcb \
    libxcb-devel \
    m4 \
    mesa-dri-drivers \
    mesa-dri-filesystem \
    mesa-dri1-drivers \
    mesa-libGL \
    mesa-private-llvm \
    mingetty \
    module-init-tools \
    mpfr \
    perl \
    perl-Module-Pluggable \
    perl-Pod-Escapes \
    perl-Pod-Simple \
    perl-libs \
    perl-version \
    policycoreutils \
    ppl \
    psmisc \
    sysvinit-tools \
    tcl \
    tix \
    tk \
    udev \
    upstart \
    util-linux-ng \
    valgrind \
    xorg-x11-proto-devel \
 && yum clean all

ENV LD_LIBRARY_PATH /usr/local/lib

RUN ln -s /usr/local/bin/python2.7 /usr/local/bin/python \
 && cd /tmp && curl https://bootstrap.pypa.io/ez_setup.py | python - --insecure \
 && cd /tmp && curl https://bootstrap.pypa.io/get-pip.py | python

