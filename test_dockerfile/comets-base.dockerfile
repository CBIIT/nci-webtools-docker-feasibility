FROM cbiitss/python27:base0

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
        R \
        R-devel \
 && yum clean all

RUN pip install --upgrade pip rpy2 mod_wsgi flask

RUN mkdir -p /usr/share/doc/R-3.3.1/html \
 && touch /usr/share/doc/R-3.3.1/html/R.css

RUN R -e "install.packages(c('devtools', 'roxygen2'), repos = 'http://cran.rstudio.com')"

RUN R -e "devtools::install_version('jsonlite',  version = '0.9.22',  repos = 'http://cran.rstudio.com'); \
          devtools::install_version('plyr',      version = '1.8.3',   repos = 'http://cran.rstudio.com'); \
          devtools::install_version('dplyr',     version = '0.4.3',   repos = 'http://cran.rstudio.com'); \
          devtools::install_version('psych',     version = '1.6.4',   repos = 'http://cran.rstudio.com'); \
          devtools::install_version('readxl',    version = '0.1.0',   repos = 'http://cran.rstudio.com'); \
          devtools::install_version('stringr',   version = '0.6',     repos = 'http://cran.rstudio.com'); \
          devtools::install_version('tidyr',     version = '0.5.0',   repos = 'http://cran.rstudio.com'); \
          devtools::install_version('plotly',    version = '3.4.13',  repos = 'http://cran.rstudio.com'); \
          devtools::install_version('xlsx',      version = '0.5.7',   repos = 'http://cran.rstudio.com'); \
          devtools::install_version('d3heatmap', version = '0.6.1.1', repos = 'http://cran.rstudio.com'); "

RUN ln -s /usr/lib/jvm/jre/lib/amd64/server/libjvm.so /usr/lib64/libjvm.so

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
  "--socket-timeout", "600", \
  "--queue-timeout", "600", \
  "--shutdown-timeout", "600", \
  "--graceful-timeout", "600", \
  "--connect-timeout", "600", \
  "--request-timeout", "600", \
  "--reload-on-changes", \
  "--rotate-logs"]
