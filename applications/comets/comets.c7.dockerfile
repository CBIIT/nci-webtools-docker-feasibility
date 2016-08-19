FROM cbiitss/r_base:c7

RUN yum -y upgrade \
 && yum -y install \
        gcc \
        gcc-c++ \
        gcc-gfortran \
        httpd-devel \
        libcurl-devel \
        libpng-devel \
        libssh2-devel \
        openssl-devel \
        readline-devel \
 && yum clean all

RUN pip install --upgrade pip rpy2 mod_wsgi flask

RUN R -e "install.packages(c('devtools', 'roxygen2'))"

RUN R -e "devtools::install_version('jsonlite',  version = '0.9.22'  ); \
          devtools::install_version('plyr',      version = '1.8.3'   ); \
          devtools::install_version('dplyr',     version = '0.4.3'   ); \
          devtools::install_version('psych',     version = '1.6.4'   ); \
          devtools::install_version('readxl',    version = '0.1.0'   ); \
          devtools::install_version('stringr',   version = '0.6'     ); \
          devtools::install_version('tidyr',     version = '0.5.0'   ); \
          devtools::install_version('plotly',    version = '3.4.13'  ); \
          devtools::install_version('d3heatmap', version = '0.6.1.1' ); "

RUN adduser -u 4004 ncianalysis

RUN mkdir -p /deploy/app /deploy/logs /deploy/wsgi /deploy/conf \
 && touch /deploy/conf/additional-configuration.conf \
 && chown -R ncianalysis:ncianalysis /deploy

USER ncianalysis
WORKDIR /deploy

ENTRYPOINT ["mod_wsgi-express"]
CMD ["start-server", "app/deploy.wsgi", \
  "--port", "8000", \
  "--server-root", "wsgi", \
  "--document-root", "app", \
  "--working-directory", "app", \
  "--directory-index", "index.html", \
  "--access-log", \
  "--log-directory", "logs", \
  "--access-log-name", "comets-access.log", \
  "--error-log-name", "comets.log", \
  "--reload-on-changes", \
  "--include-file", "conf/additional-configuration.conf", \
  "--rotate-logs"]