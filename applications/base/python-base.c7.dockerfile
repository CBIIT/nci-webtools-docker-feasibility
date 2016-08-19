# cbiitss/python:c7

FROM centos:latest

RUN yum -y install epel-release \
 && yum -y upgrade \
 && yum -y install \
 	python \
 	python-dev \
 	python-pip \
 	python-devel \
 && yum clean all