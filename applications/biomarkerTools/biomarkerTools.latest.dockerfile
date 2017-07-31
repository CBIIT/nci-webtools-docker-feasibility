FROM cbiit/biomarkertools:latest

LABEL \
  BASE_OS="CentOS 7" \
  DEFAULT_IMAGE="cbiit/biomarkertools" \
  DEFAULT_TAG="latest" \
  DESCRIPTION="Deployment environment for Biomarker Tools Suite (based on CentOS 7)" \
  VERSION="1.0" \
  UID="BIOMARKERTOOLS_1.0_C7"

RUN yum install -y git \
 && yum clean all

RUN git clone https://github.com/CBIIT/nci-webtools-dceg-sw-computational-tools /tmp/repository \
 && git clone https://github.com/CBIIT/nci-analysis-tools-web-presence /tmp/common-repository \
 && mkdir -p /deploy/app \
 && cp -r /tmp/repository/biomarkerTools/* /deploy/app \
 && cp -r /tmp/common-repository/common /deploy/app \
 && rm -rf /tmp/repository /tmp/common-repository \
 && chown -R apache:apache /deploy

CMD ["entrypoint.sh", "biomarkerTools"]