FROM cbiit/centos7_base

RUN yum install -y httpd

# install repos
RUN yum install -y epel-release \ 
        http://rpms.remirepo.net/enterprise/remi-release-7.rpm  \
        yum-utils && \
    yum-config-manager --enable remi-php70

RUN yum install -y php php-opcache 


RUN  yum install -y php-pdo php-pdo_mysql php-gd php-dom php-mbstring php-xml  

EXPOSE 80

RUN curl -SsL -O http://files.drush.org/drush.phar && mv drush.phar /usr/bin/drush
RUN chmod +x /usr/bin/drush


WORKDIR /var/www/html
RUN drush dl drupal-7.54 --drupal-project-rename drupal -y

RUN yum install -y mariadb 

# https://www.drupal.org/node/3060/release
#ENV DRUPAL_VERSION 7.56
#ENV DRUPAL_MD5 5d198f40f0f1cbf9cdf1bf3de842e534

#RUN curl -fSL "https://ftp.drupal.org/files/projects/drupal-${DRUPAL_VERSION}.tar.gz" -o drupal.tar.gz \
# 	&& echo "${DRUPAL_MD5} *drupal.tar.gz" | md5sum -c - \
# 		&& tar -xz --strip-components=1 -f drupal.tar.gz \
# 			&& rm drupal.tar.gz 
# 			&& chown -R www-data:www-data sites

CMD /usr/sbin/httpd -c "ErrorLog /dev/stdout" -DFOREGROUND

