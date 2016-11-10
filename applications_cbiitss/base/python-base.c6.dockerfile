FROM centos:6.8

LABEL \
    BASE_OS="CentOS 6.8" \
    DEFAULT_IMAGE="cbiitss/python27" \
    DEFAULT_TAG="c6" \
    DESCRIPTION="CentOS 6.8 / Python 2.7.12" \
    VERSION="1.0" \
    UID="PYTHON27_C6"

RUN yum -y install \
    https://centos6.iuscommunity.org/ius-release.rpm \
 && yum -y install \
    python27 \
    python27-devel \
    python27-pip \
    python27-setuptools \
 && yum -y upgrade \
 && yum clean all

RUN echo "alias python='python2.7'" >> /etc/bashrc \
 && ln -sf /usr/bin/pip2.7 /usr/bin/pip
