FROM centos:6.7

RUN yum -y install epel-release \
	&& yum clean all

RUN yum -y upgrade \
	&& yum clean all


# Install required packages for building python

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
	&& yum clean all \

	
	# Build python 2.7.11 from source
 
	&& cd /tmp \
	&& curl -O https://www.python.org/ftp/python/2.7.11/Python-2.7.11.tgz \
	&& tar xf Python-2.7.11.tgz \
	&& cd Python-2.7.11 \
	&& ./configure 	--enable-shared --prefix=/usr/local \
	&& make \
	&& make altinstall \
	&& cd ~ \
	&& rm -rf /tmp/* \


	# Remove build-time dependencies

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


RUN ln -s /usr/local/bin/python2.7 /usr/local/bin/python
ENV LD_LIBRARY_PATH /usr/local/lib

RUN cd /tmp && curl https://bootstrap.pypa.io/ez_setup.py | python - --version=20.9.0
RUN cd /tmp && curl https://bootstrap.pypa.io/get-pip.py | python

