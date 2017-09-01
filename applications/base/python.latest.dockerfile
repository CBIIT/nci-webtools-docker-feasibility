FROM cbiitss/python:base

LABEL \
    BASE_OS="CentOS 7" \
    DEFAULT_IMAGE="cbiitss/python" \
    DEFAULT_TAG="latest" \
    DEFAULT_CONTAINER="python" \
    DESCRIPTION="CentOS 7 / Python 3.6.x" \
    VERSION="3.6.x" \
    UID="PYTHON_3.6.x"

RUN yum -y install yum-plugin-ovl \
 && yum clean all

RUN yum -y update \
 && yum -y install \
    epel-release \
 && yum -y install \
    https://centos7.iuscommunity.org/ius-release.rpm \
 && yum -y install \
    python36u \
    python36u-pip \
    python36u-devel \
    python36u-setuptools \
    python36u-tools \
 && yum clean all \
 && pip3.6 install --upgrade pip

CMD ["python3.6"]
