FROM cbiitss:python27

COPY dependencies /tmp
WORKDIR /tmp

RUN yum -y upgrade \
 && yum -y install \
        redhat-rpm-config \
        gcc \
        gcc-c++ \
        gcc-gfortran \
        atlas-devel \
        lapack-devel \
        blas-devel \
        httpd \
        httpd-devel \
	mongodb \
	samtools \
	libxml2 \
	libxml2-python \
	libxml2-devel \
	libxslt \
	libxslt-devel \
	libxslt-python \
	python-lxml \
	python-devel \
	openssl-devel \
	xz \
 && yum localinstall -y tabix-0.2.6-2.1.x86_64.rpm \
 && yum clean all

RUN curl http://download.gna.org/wkhtmltopdf/0.12/0.12.3/wkhtmltox-0.12.3_linux-generic-amd64.tar.xz | tar xJ \
 && cp -r wkhtmltox/* /usr/

RUN pip install --upgrade pip
RUN pip install \
	flask \
	mod_wsgi \
	pandas \
	numpy \
	bokeh \
	stompest \
	stompest.async \
	twisted \
	pymongo \
	weasyprint \
	pdfkit \
	pysqlcipher \
	pymongo \
 && pip install scipy	
