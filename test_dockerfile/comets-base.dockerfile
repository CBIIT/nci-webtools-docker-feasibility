FROM ncias-d1661-v.nci.nih.gov/cbiitss/python27:base0

RUN yum -y upgrade \
 && yum -y install \
        gcc \
        gcc-c++ \
        gcc-gfortran \
        httpd-devel \
        libcurl-devel \
        R \
 && yum clean all

RUN pip install --upgrade pip rpy2
RUN R -e "install.packages(c('jsonlite', 'plyr', 'dplyr', 'psych', 'readxl', 'stringr', 'tidyr', 'plotly'), repos='http://cran.rstudio.com')"

RUN adduser -u 4004 ncianalysis

RUN mkdir -p /deploy \
 && chown -R ncianalysis:ncianalysis /deploy

RUN touch /tmp/luw01

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
