FROM cbiitss/python:base

LABEL \
    BASE_IMAGE="cbiit/centos7:base" \
    DEFAULT_IMAGE="cbiitss/ldlink" \
    DEFAULT_TAG="base" \
    DEFAULT_CONTAINER="ldlink"
    DESCRIPTION="Deployment environment for LDlink" \
    VERSION="1.0" \
    UID="LDLINK_BASE"

RUN yum install -y \
    bzip2 \
    gcc \
    httpd-devel \
    libcurl-devel \
    mongodb \
    ncurses-devel \
 && yum clean all

RUN RUN pip install --upgrade \
    pip \
    setuptools \
 && pip install \
    flask \
    mod_wsgi \
    pymongo

## install htslib (tabix, etc)
RUN pushd /tmp
 && curl -L https://github.com/samtools/htslib/releases/download/1.5/htslib-1.5.tar.bz2 | tar xj \
 && cd htslib-1.5 \
 && ./configure \
 && make \
 && make install \
 && rm -rf htslib-1.5

ENV APP_NAME="LDlink"

COPY wsgi.conf /etc/httpd/conf.d/wsgi.conf

COPY entrypoint.sh /usr/bin/entrypoint.sh

RUN chmod +x /usr/bin/entrypoint.sh \
 && ln -s /usr/bin/entrypoint.sh /entrypoint.sh

RUN mkdir -p /deploy/app /deploy/logs

WORKDIR /deploy

CMD ["entrypoint.sh", "$APP_NAME"]
