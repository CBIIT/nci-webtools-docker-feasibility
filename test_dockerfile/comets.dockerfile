FROM ncias-d1661-v.nci.nih.gov/cbiitss/python27:base0

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
 && yum clean all
 
COPY centos_6.7/dependencies/tabix-0.2.6-2.1.x86_64.rpm .

RUN yum install -y mongodb samtools \
 && yum localinstall -y tabix-0.2.6-2.1.x86_64.rpm https://bitbucket.org/wkhtmltopdf/wkhtmltopdf/downloads/wkhtmltox-0.13.0-alpha-7b36694_linux-centos6-amd64.rpm\
 && yum clean all

RUN pip install --upgrade pip
RUN pip install flask mod_wsgi pandas numpy bokeh
RUN pip install scipy
RUN pip install stompest stompest.async twisted pymongo weasyprint pdfkit pysqlcipher pymongo
