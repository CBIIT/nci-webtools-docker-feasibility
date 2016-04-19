FROM centos:6.7

RUN yum -y install epel-release

RUN yum -y upgrade

RUN yum -y install httpd httpd-devel

RUN yum -y install python \
    python-devel \
    python-pip

RUN yum -y install \
    readline-devel \
    java-1.7.0-openjdk-* \
    git

RUN ln -s /usr/lib/jvm/jre/lib/amd64/server/libjvm.so /usr/lib64/libjvm.so

RUN yum -y install gcc

RUN pip install --upgrade pip

RUN pip install flask

RUN pip install mod_wsgi

RUN yum clean all
