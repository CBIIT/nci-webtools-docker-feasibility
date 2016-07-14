FROM cbiitss:python_web

RUN yum -y upgrade && yum clean all
RUN yum -y install R && yum clean all

RUN R CMD javareconf -e
RUN ln -s /usr/lib/jvm/jre/lib/amd64/server/libjvm.so /usr/lib64/libjvm.so
RUN R -e "install.packages(c('jsonlite', 'xlsx', 'ggplot2', 'plyr', 'dplyr', 'psych', 'readxl', 'xlsx', 'openxlsx', 'jsonlite', 'rjson', 'RJSONIO', 'stringr', 'pROC'), repos='http://cran.rstudio.com')"
RUN pip install rpy2
