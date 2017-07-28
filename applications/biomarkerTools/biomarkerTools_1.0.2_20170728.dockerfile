FROM cbiit/biomarkertools:latest

RUN yum install -y git \
 && yum clean all

RUN export RELEASE="Biomarker_1.0.2_20170728" \
 && git clone -b $RELEASE https://github.com/CBIIT/nci-webtools-dceg-sw-computational-tools /tmp/repository \
 && git clone -b $RELEASE https://github.com/CBIIT/nci-analysis-tools-web-presence /tmp/common-repository \
 && mkdir -p /deploy/app \
 && cp -r /tmp/repository/biomarkerTools/* /deploy/app \
 && cp -r /tmp/common-repository/common /deploy/app \
 && rm -rf /tmp/repository /tmp/common-repository \
 && chown -R apache:apache /deploy

CMD ["entrypoint.sh", "biomarkerTools"]