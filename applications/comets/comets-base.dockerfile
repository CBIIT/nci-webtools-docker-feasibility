FROM cbiitss/r

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

RUN R -e "install.packages(c('devtools', 'roxygen2'), \
          INSTALL_opts = c('--no-html')); "

RUN R -e "devtools::install_version('jsonlite',   version = '0.9.22'  ); \
          devtools::install_version('plyr',       version = '1.8.3'   ); \
          devtools::install_version('dplyr',      version = '0.5.0'   ); \
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


RUN pip install --upgrade pip \
 && pip install \
        boto \
        flask \
        mod_wsgi \
        pyper \
        pyyaml \
        requests \
        rpy2  \
        stompest \
        stompest.async \
        twisted


RUN localedef -i en_US -f UTF-8 en_US.UTF-8

# Copy entrypoint and make it executable
COPY "./entrypoint.sh" "/usr/bin/entrypoint.sh"

RUN chmod 755 /usr/bin/entrypoint.sh \
 && ln -s /usr/bin/entrypoint.sh /entrypoint.sh

# Copy comets package installation script and make it executable
COPY "./install_comets_package.sh" "/usr/bin/install_comets_package.sh"

RUN chmod 755 /usr/bin/install_comets_package.sh \
 && ln -s /usr/bin/install_comets_package.sh /install_comets_package.sh

RUN adduser -u 4004 ncianalysis

RUN mkdir -p /deploy/app /deploy/logs \
 && chown -R ncianalysis:ncianalysis /deploy

WORKDIR /deploy/app

ENTRYPOINT ["entrypoint.sh"]