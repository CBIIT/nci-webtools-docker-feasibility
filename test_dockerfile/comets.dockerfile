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
        libxslt-devel \
        libxml2-devel \
        openssl-devel \
 && yum clean all
 
COPY centos_6.7/dependencies/tabix-0.2.6-2.1.x86_64.rpm .

RUN yum install -y mongodb samtools \
 && yum localinstall -y tabix-0.2.6-2.1.x86_64.rpm https://bitbucket.org/wkhtmltopdf/wkhtmltopdf/downloads/wkhtmltox-0.13.0-alpha-7b36694_linux-centos6-amd64.rpm\
 && yum clean all

RUN pip install --upgrade pip
RUN pip install flask mod_wsgi pandas numpy bokeh
RUN pip install scipy
RUN pip install stompest stompest.async twisted pymongo weasyprint pdfkit pysqlcipher pymongo


RUN yum -y install R && yum clean all

RUN R CMD javareconf -e
RUN ln -s /usr/lib/jvm/jre/lib/amd64/server/libjvm.so /usr/lib64/libjvm.so
COPY dependencies /tmp/

RUN R -e "install.packages(c('jsonlite', 'xlsx', 'ggplot2', 'plyr', 'dplyr', 'psych', 'readxl', 'xlsx', 'openxlsx', 'jsonlite', 'rjson', 'RJSONIO', 'stringr', 'pROC', 'VGAM'), repos='http://cran.rstudio.com')"
RUN R -e "install.packages(c('/tmp/ARTP3_0.8.34.tar.gz', '/tmp/JPSurv_2.0.19.tar.gz', '/tmp/coxph.risk_0.2.tar.gz', '/tmp/iCARE_1.1.0.tar.gz'), repos=NULL)"
RUN pip install rpy2


RUN adduser -u 4004 ncianalysis

RUN mkdir -p /deploy \
 && chown -R ncianalysis:ncianalysis /deploy

USER ncianalysis
WORKDIR /deploy

ENTRYPOINT ["mod_wsgi-express"]
CMD ["start-server", "app/deploy.wsgi", \
  "--port", "8000", \
  "--user", "ncianalysis", \
  "--group", "ncianalysis", \
  "--server-root", "wsgi", \
  "--document-root", "app", \
  "--working-directory", "app", \
  "--directory-index", "index.html", \
  "--log-directory", "logs", \
  "--rotate-logs"]
