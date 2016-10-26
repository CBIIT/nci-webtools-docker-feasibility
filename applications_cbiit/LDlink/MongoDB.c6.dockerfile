FROM centos:6.8

LABEL \
  BASE_OS="CentOS 6.8" \
  DEFAULT_IMAGE="cbiit/mongodb" \
  DEFAULT_TAG="centos6" \
  DESCRIPTION="MongoDB Server (based on CentOS 6.8)" \
  VERSION="3.2" \
  UID="MONGODB_3.2_C6"

RUN rpm --import https://www.mongodb.org/static/pgp/server-3.2.asc \
 && yum -y install yum-utils \
 && yum-config-manager --add-repo https://repo.mongodb.org/yum/redhat/6/mongodb-org/3.2/x86_64/ \
 && yum -y install mongodb-org \
 && yum -y upgrade \
 && yum clean all

RUN mkdir -p /data/db

EXPOSE 27017

CMD ["mongod"]