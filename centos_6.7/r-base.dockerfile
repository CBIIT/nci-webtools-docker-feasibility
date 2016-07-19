FROM cbiitss:python-web

RUN yum -y upgrade && yum clean all
RUN yum -y install R && yum clean all

RUN R CMD javareconf -e
RUN ln -s /usr/lib/jvm/jre/lib/amd64/server/libjvm.so /usr/lib64/libjvm.so
COPY dependencies /tmp/

RUN R -e "install.packages(c('jsonlite', 'xlsx', 'ggplot2', 'plyr', 'dplyr', 'psych', 'readxl', 'xlsx', 'openxlsx', 'jsonlite', 'rjson', 'RJSONIO', 'stringr', 'pROC', 'data.table', 'Formula', 'VGAM'), repos='http://cran.rstudio.com')"
RUN R -e "install.packages(c('/tmp/ARTP3_0.8.34.tar.gz', '/tmp/JPSurv_2.0.19.tar.gz', '/tmp/coxph.risk_0.2.tar.gz', '/tmp/iCARE_1.1.0.tar.gz'), repos=NULL)"
RUN pip install rpy2
