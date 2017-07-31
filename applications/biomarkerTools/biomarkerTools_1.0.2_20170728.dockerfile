FROM cbiit/biomarkertools:latest

LABEL \
  BASE_IMAGE="cbiit/centos7:base" \
  DEFAULT_IMAGE="cbiit/biomarkertools" \
  DEFAULT_TAG="1.0.2_20170728" \
  DESCRIPTION="Deployment environment for biomarker tools suite" \
  VERSION="1.0.2_20170728" \
  UID="BIOMARKERTOOLS_1.0.2_20170728"

RUN yum install -y git \
 && yum clean all

RUN export RELEASE="Biomarker_1.0.2_20170728" \
 && export REPOSITORY_URL="https://github.com/CBIIT/nci-webtools-dceg-sw-computational-tools" \
 && export COMMON_REPOSITORY_URL="https://github.com/CBIIT/nci-analysis-tools-web-presence" \
 && git clone -b $RELEASE $REPOSITORY_URL /tmp/repository \
 && git clone -b $RELEASE $COMMON_REPOSITORY_URL /tmp/common-repository \
 && mkdir -p /deploy/app \
 && cp -r /tmp/repository/biomarkerTools/* /deploy/app \
 && cp -r /tmp/common-repository/common /deploy/app \
 && rm -rf /tmp/repository /tmp/common-repository \
 && chown -R apache:apache /deploy

CMD ["entrypoint.sh", "biomarkerTools"]