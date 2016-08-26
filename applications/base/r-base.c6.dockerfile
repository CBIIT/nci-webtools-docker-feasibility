# cbiitss/r_base:c6

FROM cbiitss/python27:c6

RUN yum -y install epel-release \
 && yum -y upgrade \
 && yum -y install \
 	R \
 	R-devel \
 && yum clean all

RUN echo 'local({r <- getOption("repos"); r["CRAN"] <- "http://cran.rstudio.com/"; options(repos = r)})' >> /usr/lib64/R/library/base/R/Rprofile

RUN mkdir /usr/share/doc/R-3.3.1/html
