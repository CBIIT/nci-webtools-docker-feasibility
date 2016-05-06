FROM	centos:6.7


RUN	printf "\
[mongodb-org-3.2] \n\
name=MongoDB Repository \n\
baseurl=https://repo.mongodb.org/yum/redhat/6/mongodb-org/3.2/x86_64/ \n\
gpgcheck=1 \n\
enabled=1 \n\
gpgkey=https://www.mongodb.org/static/pgp/server-3.2.asc \n\
" >> /etc/yum.repos.d/mongodb-org-3.2.repo

RUN mkdir -p /data/db

RUN	yum install -y mongodb-org &&\
	yum clean all

