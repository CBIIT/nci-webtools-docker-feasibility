FROM cbiitss:python

RUN yum -y upgrade

RUN yum -y install R

RUN yum clean all

RUN pip install argparse

#RUN pip install rpy2==2.5.5


RUN R CMD javareconf -e

RUN R -e "install.packages(c('jsonlite', 'xlsx'), repos='http://cran.rstudio.com')"

