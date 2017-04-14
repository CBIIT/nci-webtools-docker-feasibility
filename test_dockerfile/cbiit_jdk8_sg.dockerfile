FROM cbiit/centos7_base
ARG version

ADD cbiit-${version}.x86_64.rpm /cbiit-${version}.x86_64.rpm
RUN yum -y upgrade \
 && yum -y localinstall cbiit-${version}.x86_64.rpm \
 && yum clean all
RUN rm -f /cbiit-${version}.x86_64.rpm

