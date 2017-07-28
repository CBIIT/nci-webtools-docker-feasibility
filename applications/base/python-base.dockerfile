FROM cbiit/centos7:base

LABEL \
    BASE_OS="CentOS 7" \
    DEFAULT_IMAGE="cbiit/python-base" \
    DEFAULT_TAG="latest" \
    DESCRIPTION="CentOS 7 / Python 2.7.5" \
    VERSION="1.0" \
    UID="PYTHON_2.7.5"

## Remove override_install_langs=en_US.UTF-8
RUN { \
  echo "[main]"; \
  echo "cachedir=/var/cache/yum/\$basearch/\$releasever"; \
  echo "keepcache=0"; \
  echo "debuglevel=2"; \
  echo "logfile=/var/log/yum.log"; \
  echo "exactarch=1"; \
  echo "obsoletes=1"; \
  echo "gpgcheck=1"; \
  echo "plugins=1"; \
  echo "installonly_limit=5"; \
  echo "bugtracker_url=http://bugs.centos.org/set_project.php?project_id=23&ref=http://bugs.centos.org/bug_report_page.php?category=yum"; \
  echo "distroverpkg=centos-release"; \
  echo "tsflags=nodocs"; \
} | tee "/etc/yum.conf"

RUN yum -y install \
    yum-plugin-ovl \
 && yum -y update \
 && yum -y install \
    epel-release \
 && yum -y install \
    python \
    python-pip \
    python-devel \
 && yum clean all \
 && pip install --upgrade pip

CMD ["python"]
