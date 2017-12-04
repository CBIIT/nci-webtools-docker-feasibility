FROM cbiit/centos7:base

LABEL \
    BASE_IMAGE="cbiit/centos7:base" \
    DEFAULT_IMAGE="cbiitss/activemq" \
    DEFAULT_TAG="latest" \
    DEFAULT_CONTAINER="activemq" \
    DESCRIPTION="CentOS 7 / ActiveMQ 5.15.2" \
    VERSION="5.15.2" \
    UID="ACTIVEMQ_5.15.2"

RUN sed -i '/override_install_langs/d' /etc/yum.conf \
 && yum -y install yum-plugin-ovl \
 && yum -y update \
 && yum -y reinstall glibc glibc-common \
 && yum clean all

RUN yum -y update \
 && yum -y install \
    gzip \
    java \
    tar \
 && yum clean all

ENV ACTIVEMQ_HOME=/opt/activemq \
    ACTIVEMQ_VERSION="5.15.2" \
    JAVA_HOME=/usr/lib/jvm/jre-1.8.0-openjdk

RUN mkdir -p $ACTIVEMQ_HOME \
 && pushd $ACTIVEMQ_HOME \
 && curl https://www.apache.org/dist/activemq/${ACTIVEMQ_VERSION}/apache-activemq-${ACTIVEMQ_VERSION}-bin.tar.gz | tar xz --strip-components=1

COPY conf/activemq.xml $ACTIVEMQ_HOME/conf/activemq.xml

WORKDIR $ACTIVEMQ_HOME

CMD /opt/activemq/bin/activemq console
