FROM centos:6.8

LABEL \
  BASE_OS="CentOS 6.8" \
  DEFAULT_IMAGE="cbiitss/activemq" \
  DEFAULT_TAG="centos6" \
  DESCRIPTION="ActiveMQ (based on CentOS 6.8)" \
  VERSION="5.14.0" \
  UID="ACTIVEMQ_5.14.0_C6"

RUN yum -y upgrade \
 && yum -y install java-1.7.0-openjdk \
 && cd /usr/local
 && curl http://www.us.apache.org/dist/activemq/5.14.0/apache-activemq-5.14.0-bin.tar.gz | tar xz

EXPOSE 61613

ENTRYPOINT ["/usr/local/apache-activemq-5.14.0/bin/activemq"]
CMD ["start"]