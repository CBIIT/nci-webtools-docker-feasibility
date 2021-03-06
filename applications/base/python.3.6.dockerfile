FROM cbiit/centos7:base

LABEL \
    BASE_IMAGE="cbiit/centos7:base" \
    DEFAULT_IMAGE="cbiitss/python" \
    DEFAULT_TAG="3.6" \
    DEFAULT_CONTAINER="python" \
    DESCRIPTION="CentOS 7 / Python 3.6.x" \
    VERSION="3.6.x" \
    UID="PYTHON_3.6.x"

RUN sed -i '/override_install_langs/d' /etc/yum.conf \
 && yum -y install yum-plugin-ovl \
 && yum -y update \
 && yum -y reinstall glibc glibc-common \
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
