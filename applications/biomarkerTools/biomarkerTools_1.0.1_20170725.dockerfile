FROM cbiit/biomarkerTools:latest

ENV RELEASE="Biomarker_1.0.1_20170725"

RUN yum install -y git \
 && yum clean all

RUN git clone -b $RELEASE https://github.com/CBIIT/nci-webtools-dceg-sw-computational-tools /tmp/repository \
 && git clone -b $RELEASE https://github.com/CBIIT/nci-analysis-tools-web-presence /tmp/common-repository \
 && mkdir -p /deploy/app \
 && cp -r /tmp/repository/biomarkerTools/* /deploy/app \
 && cp -r /tmp/common-repositry/common /deploy/app \
 && rm -rf /tmp/repository /tmp/common-repository

COPY "./entrypoint.sh" "/usr/bin/entrypoint.sh"

RUN chmod 755 /usr/bin/entrypoint.sh \
 && ln -s /usr/bin/entrypoint.sh /entrypoint.sh

ENTRYPOINT ["entrypoint.sh"]
