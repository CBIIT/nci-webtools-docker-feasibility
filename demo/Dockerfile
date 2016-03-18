FROM centos:latest

RUN yum -y install epel-release

RUN yum -y upgrade && yum -y install \
    httpd \
    httpd-devel \
    python \
    python-devel \
    python-pip && yum clean all 

RUN pip install --upgrade pip && pip install flask

EXPOSE 80

COPY httpd.conf /etc/httpd/conf/httpd.conf
COPY demo.py /var/www/html/demo.py
COPY run.sh /run.sh
RUN chmod -v +x /run.sh

CMD ["/run.sh"]