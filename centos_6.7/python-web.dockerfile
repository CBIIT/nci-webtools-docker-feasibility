FROM cbiitss:python27

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

RUN pip install --upgrade pip
RUN pip install flask mod_wsgi pandas numpy bokeh
RUN pip install scipy
RUN pip install stompest stompest.async twisted pymongo weasyprint pdfkit pysqlcipher
