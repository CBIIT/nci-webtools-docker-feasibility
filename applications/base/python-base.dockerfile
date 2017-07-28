FROM cbiit/centos7:base

LABEL \
    BASE_OS="CentOS 7" \
    DEFAULT_IMAGE="cbiit/python-base" \
    DEFAULT_TAG="latest" \
    DESCRIPTION="CentOS 7 / Python 2.7.5" \
    VERSION="1.0" \
    UID="PYTHON_2.7.5"

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