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
        libxml2-devel \ 
        openssl-devel \
        readline-devel \
        subversion \
 && yum clean all

RUN pip install --upgrade pip rpy2 mod_wsgi flask requests pyyaml pyper

RUN R -e "install.packages(c('devtools', 'roxygen2'), INSTALL_opts = c('--no-html')); "


RUN R -e "devtools::install_version('jsonlite',   version = '0.9.22'  ); \
          devtools::install_version('plyr',       version = '1.8.3'   ); \
          devtools::install_version('dplyr',      version = '0.4.3'   ); \
          devtools::install_version('Hmisc',      version = '4.0-2'   ); \
          devtools::install_version('psych',      version = '1.6.4'   ); \
          devtools::install_version('readxl',     version = '0.1.0'   ); \
          devtools::install_version('stringr',    version = '0.6'     ); \
          devtools::install_version('tidyr',      version = '0.5.0'   ); \
          devtools::install_version('plotly',     version = '3.4.13'  ); \
          devtools::install_version('xlsx',       version = '0.5.7'   ); \
          devtools::install_version('shiny',      version = '0.14.1'  ); \
          devtools::install_version('shinyFiles', version = '0.6.2'   ); \
          devtools::install_version('d3heatmap',  version = '0.6.1.1' ); \
          devtools::install_github('Bioconductor-mirror/BiocInstaller', ref = 'release-3.3'); \
          devtools::install_bioc('Biobase'); \
          devtools::install_version('ClassComparison', repos = 'http://silicovore.com/OOMPA/' ); "

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
  "--socket-timeout", "900", \
  "--queue-timeout", "900", \
  "--shutdown-timeout", "900", \
  "--graceful-timeout", "900", \
  "--connect-timeout", "900", \
  "--request-timeout", "900", \
  "--reload-on-changes", \
  "--processes", "3", \
  "--threads", "1", \
  "--rotate-logs"]
