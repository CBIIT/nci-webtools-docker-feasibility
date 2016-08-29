FROM centos:7

LABEL \
  BASE_OS="CentOS 7" \
  DEFAULT_IMAGE="cbiitss/mongodb" \
  DEFAULT_TAG="centos7" \
  DESCRIPTION="MongoDB Server (based on CentOS 7)" \
  VERSION="3.2" \
  UID="MONGODB_3.2_C7"

RUN rpm --import https://www.mongodb.org/static/pgp/server-3.2.asc \
 && yum -y install yum-utils \
 && yum-config-manager --add-repo https://repo.mongodb.org/yum/redhat/7/mongodb-org/3.2/x86_64/ \
 && yum -y install mongodb-org \
 && yum -y upgrade \
 && yum clean all

RUN mkdir -p /data/db

EXPOSE 27017

CMD ["mongod"]