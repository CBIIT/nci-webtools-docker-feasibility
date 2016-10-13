FROM centos:latest

LABEL \
    BASE_OS='CentOS 7' \
    DEFAULT_IMAGE='cbiitss/drupal' \
    DEFAULT_TAG='8.2' \
    DESCRIPTION='CentOS 7 / Httpd 2.4.23 / PHP 7.0.11 / Drupal 8.2' \
    VERSION='1.0' \
    UID='CBIITSS_DRUPAL_8.2'

RUN yum -y install https://centos7.iuscommunity.org/ius-release.rpm \
 && yum -y update \
 && yum -y install \
    httpd24u \
    httpd24u-mod_ssl \
    mod_php70u \
    php70u-cli \
    php70u-common \
#   php70u-fpm \
#   php70u-fpm-httpd \
    php70u-gd \
    php70u-json \
    php70u-mbstring \
    php70u-mysqlnd \
    php70u-opcache \
    php70u-pdo \
    php70u-pgsql \
    php70u-xml \
 && yum clean all

RUN { \
    echo -e '<FilesMatch \.php$>'; \
    echo -e '\tSetHandler application/x-httpd-php'; \
    echo -e '</FilesMatch>'; \
    echo -e ; \
    echo -e 'DirectoryIndex disabled'; \
    echo -e 'DirectoryIndex index.php index.html'; \
    echo -e ; \

    echo -e '<Directory /var/www/>'; \
    echo -e '\tOptions -Indexes'; \
    echo -e '\tAllowOverride All'; \
    echo -e '</Directory>'; \

    echo -e '<Directory /var/www/html/>'; \
    echo -e '\tRewriteEngine on'; \
    echo -e '\tRewriteBase /'; \
    echo -e '\tRewriteCond %{REQUEST_FILENAME} !-f'; \
    echo -e '\tRewriteRule ^(.*)$ index.php?q=$1 [L,QSA]'; \
    echo -e '</Directory>'; \

} | tee '/etc/httpd/conf.d/docker-php.conf'





RUN { \
    echo -e 'opcache.memory_consumption=128'; \
    echo -e 'opcache.interned_strings_buffer=8'; \
    echo -e 'opcache.max_accelerated_files=4000'; \
    echo -e 'opcache.revalidate_freq=60'; \
    echo -e 'opcache.fast_shutdown=1'; \
    echo -e 'opcache.enable_cli=1'; \
} > /etc/php.d/opcache-recommended.ini


WORKDIR /var/www/html

# https://www.drupal.org/node/3060/release
ENV DRUPAL_VERSION 8.2.0
ENV DRUPAL_MD5 5d0c57d2fd6338d60a5e311acc188b44

RUN curl -fSL "https://ftp.drupal.org/files/projects/drupal-${DRUPAL_VERSION}.tar.gz" -o drupal.tar.gz \
    && echo -e  "${DRUPAL_MD5} *drupal.tar.gz" | md5sum -c - \
    && tar -xz --strip-components=1 -f drupal.tar.gz \
    && rm drupal.tar.gz