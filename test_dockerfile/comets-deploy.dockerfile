FROM cbiitss/python27:base0

RUN yum -y upgrade \
 && yum -y install \
        gcc \
        gcc-c++ \
        gcc-gfortran \
        httpd-devel \
        libcurl-devel \
        libssh2-devel \
        openssl-devel \
        R \
        R-devel \
 && yum clean all

RUN pip install --upgrade pip rpy2 mod_wsgi flask

RUN R -e "install.packages(c('devtools', 'roxygen2'), repos = 'http://cran.rstudio.com')"

RUN R -e "require(devtools); \ 
            install_version('jsonlite',  version = '0.9.22',  repos = 'http://cran.rstudio.com'); \
            install_version('plyr',      version = '1.8.3',   repos = 'http://cran.rstudio.com'); \
            install_version('dplyr',     version = '0.4.3',   repos = 'http://cran.rstudio.com'); \
            install_version('psych',     version = '1.6.4',   repos = 'http://cran.rstudio.com'); \
            install_version('readxl',    version = '0.1.0',   repos = 'http://cran.rstudio.com'); \
            install_version('stringr',   version = '0.6',     repos = 'http://cran.rstudio.com'); \
            install_version('tidyr',     version = '0.5.0',   repos = 'http://cran.rstudio.com'); \
            install_version('plotly',    version = '3.4.13',  repos = 'http://cran.rstudio.com'); "

RUN adduser -u 4004 ncianalysis

RUN mkdir -p /deploy \
 && chown -R ncianalysis:ncianalysis /deploy

ADD comets.tar /deploy/

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
  "--reload-on-changes", \
  "--rotate-logs"]
