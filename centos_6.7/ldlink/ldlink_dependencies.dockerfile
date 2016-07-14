FROM cbiitss:python_web

COPY dependencies/tabix-0.2.6-2.1.x86_64.rpm .

RUN yum install -y git mongodb samtools \
 && yum localinstall -y tabix-0.2.6-2.1.x86_64.rpm \
 && yum clean all

RUN pip install pymongo

RUN adduser -u 4004 ncianalysis

RUN mkdir -p /deploy/app /deploy/logs /deploy/wsgi /local/content/ldlink \
 && chown -R ncianalysis:ncianalysis /deploy /local/content

USER ncianalysis
WORKDIR /deploy

ENTRYPOINT ["mod_wsgi-express"]
CMD ["start-server", "app/deploy.wsgi", \
  "--port", "8090", \
  "--user", "ncianalysis", \
  "--group", "ncianalysis", \
  "--server-root", "wsgi", \
  "--document-root", "app", \
  "--working-directory", "app", \
  "--directory-index", "index.html", \
  "--log-directory", "logs", \
  "--rotate-logs"]
