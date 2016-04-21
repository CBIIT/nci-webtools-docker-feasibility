FROM centos:6.7

RUN yum -y install epel-release \
	&& yum clean all

RUN yum -y upgrade \
	&& yum clean all

RUN yum -y groupinstall development \
	&& yum clean all

RUN yum -y install \
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
	&& yum clean all

#build python 2.7.11 from source
 
RUN cd /tmp \
	&& curl -O https://www.python.org/ftp/python/2.7.11/Python-2.7.11.tgz \
	&& tar xf Python-2.7.11.tgz \
	&& cd Python-2.7.11 \
	&& ./configure --prefix=/usr/local \
	&& make \
	&& make altinstall

RUN ln -s /usr/local/bin/python2.7 /usr/local/bin/python

RUN curl https://bootstrap.pypa.io/ez_setup.py | python
RUN curl https://bootstrap.pypa.io/get-pip.py | python

