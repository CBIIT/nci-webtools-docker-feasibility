FROM cbiitss/python:base

LABEL \
    BASE_OS="CentOS 7" \
    DEFAULT_IMAGE="cbiitss/r" \
    DEFAULT_TAG="base" \
    DEFAULT_CONTAINER="r" \
    DESCRIPTION="CentOS 7 / Python 2.7.5 / R 3.4.x" \
    VERSION="3.4.x" \
    UID="R_3.4.x"

RUN yum -y update \
 && yum -y install \
    epel-release \
 && yum -y install \
    R \
    R-devel \
 && yum clean all

RUN { \
    echo "local({"                                      ;\
    echo "    r <- getOption('repos')"                  ;\
    echo "    r['CRAN'] <- 'http://cran.rstudio.com/'"  ;\
    echo "    options(repos = r)"                       ;\
    echo "})"                                           ;\
} | tee -a "/usr/lib64/R/library/base/R/Rprofile"

RUN ln -s /usr/lib/jvm/jre/lib/amd64/server/libjvm.so /usr/lib64/libjvm.so \
 && install -Dv /dev/null /usr/share/doc/R-3.{0-9}.{0-9}/html/R.css

CMD ["R"]
