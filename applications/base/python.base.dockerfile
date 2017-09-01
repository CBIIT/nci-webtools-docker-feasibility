FROM cbiit/centos7:base

LABEL \
    BASE_OS="CentOS 7" \
    DEFAULT_IMAGE="cbiitss/python" \
    DEFAULT_TAG="base" \
    DEFAULT_CONTAINER="python" \
    DESCRIPTION="CentOS 7 / Python 2.7.5" \
    VERSION="2.7.5" \
    UID="PYTHON_2.7.5"

RUN yum -y install yum-plugin-ovl \
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
