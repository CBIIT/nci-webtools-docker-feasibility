FROM centos:latest

LABEL \
    BASE_OS="CentOS 7" \
    DEFAULT_IMAGE="cbiit/python27" \
    DEFAULT_TAG="c7" \
    DESCRIPTION="CentOS 7 / Python 2.7.5" \
    VERSION="1.0" \
    UID="PYTHON27_C7"

RUN yum -y install epel-release \
 && yum -y upgrade \
 && yum -y install \
    python \
    python-dev \
    python-pip \
    python-devel \
 && yum clean all