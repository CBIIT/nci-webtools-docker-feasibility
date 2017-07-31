FROM cbiit/python_base:latest

LABEL \
    BASE_OS="CentOS 7" \
    DEFAULT_IMAGE="cbiit/r_base" \
    DEFAULT_TAG="latest" \
    DESCRIPTION="CentOS 7 / Python 2.7.5 / R 3.4.1" \
    VERSION="1.0" \
    UID="R_3.4.1"

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
 && install -Dv /dev/null /usr/share/doc/R-3.4.1/html/R.css

CMD ["R"]
