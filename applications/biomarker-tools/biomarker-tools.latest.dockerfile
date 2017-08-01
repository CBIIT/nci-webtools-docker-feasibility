FROM cbiit/biomarker-tools:latest

LABEL \
  BASE_IMAGE="cbiit/centos7:base" \
  DEFAULT_IMAGE="cbiit/biomarker-tools" \
  DEFAULT_TAG="latest" \
  DESCRIPTION="Deployment environment for biomarker tools suite" \
  VERSION="LATEST" \
  UID="BIOMARKER_TOOLS_LATEST"

RUN yum install -y git \
 && yum clean all

RUN export REPOSITORY_URL="https://github.com/CBIIT/nci-webtools-dceg-sw-computational-tools" \
 && export COMMON_REPOSITORY_URL="https://github.com/CBIIT/nci-analysis-tools-web-presence" \
 && git clone $REPOSITORY_URL /tmp/repository \
 && git clone $COMMON_REPOSITORY_URL /tmp/common-repository \
 && mkdir -p /deploy/app \
 && cp -r /tmp/repository/biomarkerTools/* /deploy/app \
 && cp -r /tmp/common-repository/common /deploy/app \
 && rm -rf /tmp/repository /tmp/common-repository \
 && chown -R apache:apache /deploy

CMD ["entrypoint.sh", "biomarkerTools"]