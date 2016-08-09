FROM centos:7

RUN yum -y upgrade \
 && yum -y localinstall https://nciws-d709-v.nci.nih.gov/cbiit-repo7/cbiit-openssl1.0.1-t-2.el7.x86_64.rpm \
 && yum -y localinstall https://nciws-d709-v.nci.nih.gov/cbiit-repo7/cbiit-expat2-1.0-2.el7.x86_64.rpm \
 && yum -y localinstall https://nciws-d709-v.nci.nih.gov/cbiit-repo7/cbiit-openldap2.4-44-2.el7.x86_64.rpm \
 && yum -y localinstall https://nciws-d709-v.nci.nih.gov/cbiit-repo7/cbiit-pcre8-38-1.el7.x86_64.rpm \
 && yum -y localinstall https://nciws-d709-v.nci.nih.gov/cbiit-repo7/cbiit-apache2.4-20-1.el7.x86_64.rpm \
 && yum clean all
 
ADD https://nciws-d709-v.nci.nih.gov/cbiit-package/cbiitss/mod_auth_openidc.so /usr/local/apache/modules/
ENTRYPOINT ["/usr/local/apache/bin/apachectl", "start", "-DFOREGROUND"]
