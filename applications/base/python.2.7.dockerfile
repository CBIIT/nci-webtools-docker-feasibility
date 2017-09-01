FROM cbiit/centos7:base

LABEL \
    BASE_IMAGE="cbiit/centos7:base" \
    DEFAULT_IMAGE="cbiitss/python" \
    DEFAULT_TAG="2.7" \
    DEFAULT_CONTAINER="python" \
    DESCRIPTION="CentOS 7 / Python 2.7.5" \
    VERSION="2.7.5" \
    UID="PYTHON_2.7.5"

RUN sed -i '/override_install_langs/d' /etc/yum.conf \
 && yum -y install yum-plugin-ovl \
 && yum -y update \
 && yum -y reinstall glibc glibc-common \
 && yum clean all

RUN yum -y update \
 && yum -y install \
    epel-release \
 && yum -y install \
    python \
    python-pip \
    python-devel \
 && yum clean all \
 && pip install --upgrade pip

CMD ["python"]
