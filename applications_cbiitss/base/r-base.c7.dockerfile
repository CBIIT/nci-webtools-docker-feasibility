FROM cbiitss/python27:c7

LABEL \
    BASE_OS="CentOS 7" \
    DEFAULT_IMAGE="cbiitss/r_base" \
    DEFAULT_TAG="c7" \
    DESCRIPTION="CentOS 7 / Python 2.7.5 / R 3.3.1" \
    VERSION="1.0" \
    UID="RBASE_1.0"

RUN yum -y install epel-release \
 && yum -y upgrade \
 && yum -y install \
    R \
    R-devel \
 && yum clean all

RUN echo 'local({r <- getOption("repos"); r["CRAN"] <- "http://cran.rstudio.com/"; options(repos = r)})' >> /usr/lib64/R/library/base/R/Rprofile

RUN mkdir -p /usr/share/doc/R-3.3.1/html \
 && touch /usr/share/doc/R-3.3.1/html/R.css
