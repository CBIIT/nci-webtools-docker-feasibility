# cbiitss/apc:c6

FROM cbiitss/r_base:c6

RUN yum -y install epel-release \
 && yum -y upgrade \
 && yum -y install \
    httpd-devel \
    readline-devel \
 && yum clean all

RUN pip install --upgrade pip flask rpy2 mod_wsgi

RUN R -e "install.packages(c('jsonlite', 'xlsx'))"

RUN ln -s /usr/lib/jvm/jre/lib/amd64/server/libjvm.so /usr/lib64/libjvm.so

RUN mkdir -p /deploy

WORKDIR /deploy

ENTRYPOINT ["mod_wsgi-express"]
CMD ["start-server", "app/apc.wsgi", \
  "--port", "8000", \
  "--user", "apache", \
  "--group", "apache", \
  "--server-root", "wsgi", \
  "--document-root", "app", \
  "--working-directory", "app", \
  "--directory-index", "index.html", \
  "--log-directory", "logs", \
  "--access-log", \
  "--access-log-name", "apc-access.log", \
  "--error-log-name", "apc.log", \
  "--rotate-logs"]