FROM centos:6.7

RUN curl https://setup.ius.io | sh

RUN yum -y upgrade \
 && yum -y install \
	python27 \
	python27-devel \
	python27-pip \
	
	gcc \
	httpd \
	httpd-devel \
	readline-devel \	
 && yum clean all

RUN pip2.7 install --upgrade pip && pip2.7 install flask mod_wsgi
