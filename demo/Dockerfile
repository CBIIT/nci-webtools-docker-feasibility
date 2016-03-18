FROM centos:latest
MAINTAINER http://www.centos.org
LABEL Vendor="CentOS"
LABEL License=GPLv2
LABEL Version=2.4.6-31

RUN yum -y install epel-release

RUN yum -y upgrade && yum -y install \
    httpd \
    httpd-devel \
    python \
    python-devel \
    python-pip && yum clean all 

EXPOSE 80

COPY httpd.conf /etc/httpd/conf/httpd.conf
COPY demo.py /var/www/html/demo.py

RUN nohup python /var/www/html/demo.py &
RUN rm -rf /run/httpd/* /tmp/httpd*
CMD ["apachectl", "-DFOREGROUND"]