FROM cbiit/centos7_base

RUN yum -y upgrade \
 && yum -y localinstall https://nciws-d709-v.nci.nih.gov/cbiit-repo7/cbiit-jdk1.8-121-1.el7.x86_64.rpm \
 && yum clean all


