FROM ncidockerhub.nci.nih.gov/cbiit/centos7_base

ADD testyum.repo  /etc/yum.repos.d/testyum.repo

RUN yum -y upgrade \
 && yum -y install cbiit-apache2.4.x86_64 \
 && yum clean all

ENTRYPOINT ["/usr/local/apache/bin/apachectl", "start", "-DFOREGROUND"]

