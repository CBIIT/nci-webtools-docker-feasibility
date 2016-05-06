
RUN	cat <<EOT >> /etc/yum.repos.d/mongodb-org-3.2.repo
[mongodb-org-3.2]
name=MongoDB Repository
baseurl=https://repo.mongodb.org/yum/redhat/$releasever/mongodb-org/3.2/x86_64/
gpgcheck=1
enabled=1
gpgkey=https://www.mongodb.org/static/pgp/server-3.2.asc
EOT

RUN	cat <<EOT >> /deploy.sh
#!/bin/bash
service mongod start
EOT

RUN mkdir -p /data/db

RUN	yum install -y mongodb-org &&\
	yum clean all

RUN semanage port -a -t mongod_port_t -p tcp 27017