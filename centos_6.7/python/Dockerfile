FROM centos:6.7

RUN yum -y install epel-release \
	&& yum clean all

RUN yum -y upgrade \
	&& yum clean all

RUN yum -y --setopt=group_package_types=optional groupinstall development \
	&& yum clean all

RUN yum -y install \
	bluez-libs-devel \
	bzip2 \
	bzip2-devel \
	expat-devel \
	findutils \
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
	tar \
	tcl-devel \
	tix-devel \
	tk-devel \
	zlib-devel \
	gdbm-devel \
	valgrind-devel \
	&& yum clean all