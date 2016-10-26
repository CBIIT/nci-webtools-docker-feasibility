FROM cbiit/python27:c6

LABEL \
    BASE_OS="CentOS 6.8" \
    DEFAULT_IMAGE="cbiit/r_base" \
    DEFAULT_TAG="c6" \
    DESCRIPTION="CentOS 6.8 / Python 2.7.12 / R 3.3.1" \
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
