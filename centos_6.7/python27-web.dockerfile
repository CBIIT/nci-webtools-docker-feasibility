FROM cbiitss:python27

RUN yum -y upgrade \
    	&& yum -y install gcc httpd httpd-devel \
	&& yum clean all

RUN pip install --upgrade pip
RUN pip install flask mod_wsgi pandas numpy scipy 
