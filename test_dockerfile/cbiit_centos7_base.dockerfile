FROM cbiit/centos7:init

RUN echo "# override_install_langs=en_US.UTF-8" >> /etc/yum.conf \
 && echo "tsflags=nodocs" >> /etc/yum.conf \
# && echo "LANG=\"en_US.UTF-8\"" > /etc/locale.conf \
# && echo 'container' > /etc/yum/vars/infra \
 && ln -s ../usr/share/zoneinfo/America/New_York /etc/localtime \
 && /bin/date +%Y%m%d_%H%M > /etc/BUILDTIME

ENV LANG=en_US
RUN yum install -y yum-plugin-ovl && yum -y upgrade \
 && yum reinstall -y glibc-common \
 && yum reinstall -y glibc \
 && yum clean all


RUN  rm -rf /tmp/* \
 && rm -rf /var/log/* \
# && rm -rf /var/cache/yum/* \
 && rm -rf /boot 

