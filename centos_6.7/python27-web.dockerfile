FROM cbiitss:python27

RUN yum -y upgrade && yum clean all
RUN yum -y install httpd httpd-devel && yum clean all

RUN pip install --upgrade pip
RUN pip install flask mod_wsgi 
