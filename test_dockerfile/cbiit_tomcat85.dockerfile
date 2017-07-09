FROM ncidockerhub.nci.nih.gov/cbiit/centos7_base

ADD testyum.repo  /etc/yum.repos.d/testyum.repo

RUN yum -y upgrade \
 && yum -y install cbiit-jdk1.8 cbiit-tomcat8.5 \
 && yum clean all

