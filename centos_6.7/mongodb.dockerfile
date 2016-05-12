FROM	centos:6.7

RUN	rpm --import https://www.mongodb.org/static/pgp/server-3.2.asc &&\
	yum install -y yum-utils &&\
	yum-config-manager --add-repo https://repo.mongodb.org/yum/redhat/6/mongodb-org/3.2/x86_64/ &&\
	yum install -y mongodb-org &&\
	yum clean all

CMD	["mongod"]
