from centos:latest

RUN yum -y upgrade \
 && yum -y install \
    blas-devel \
    epel-release \
    gcc \
    gcc-c++ \
    gcc-gfortran \
    httpd \
    httpd-devel \
    lapack-devel \
    libxml2-devel \
    libxslt-devel \
    mongodb \
    openssl-devel \
    python \
    python-devel
    python-pip \
    readline-devel \
    samtools \
    xz \
 && yum localinstall -y https://nciws-d709-v.nci.nih.gov/cbiit-package/cbiitss/rpms/tabix-0.2.6-2.1.x86_64.rpm \
 && yum localinstall -y https://nciws-d709-v.nci.nih.gov/cbiit-package/cbiitss/rpms/wkhtmltox-0.12.2.1_linux-centos7-amd64.rpm

RUN pip install --upgrade pip \
 && pip install \
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