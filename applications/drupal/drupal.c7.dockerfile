FROM centos:latest

LABEL \
    BASE_OS="CentOS 7" \
    DEFAULT_IMAGE="cbiit/drupal" \
    DEFAULT_TAG="8.2" \
    DESCRIPTION="CentOS 7 / httpd 2.4.23 / php 7.0.11 / drupal 8.2.0" \
    VERSION="1.0" \
    UID="CBIITSS_DRUPAL_8.2"

RUN yum -y install https://centos7.iuscommunity.org/ius-release.rpm \
 && yum -y update \
 && yum -y install \
    libpng12-devel \
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
    echo "ServerName localhost"                            ; \
    echo "ServerSignature Off"                             ; \
    echo "ServerTokens Prod"                               ; \
    echo "TraceEnable Off"                                 ; \
    echo "Header always append X-Frame-Options SAMEORIGIN" ; \
    echo "Header set X-XSS-Protection \"1; mode=block\""   ; \
    echo                                                   ; \
    echo "AccessFileName .htaccess"                        ; \
    echo "DirectoryIndex disabled"                         ; \
    echo "DirectoryIndex index.php index.html"             ; \
    echo                                                   ; \
    echo "<FilesMatch \.php$>"                             ; \
    echo "    SetHandler application/x-httpd-php"          ; \
    echo "</FilesMatch>"                                   ; \
    echo                                                   ; \
    echo "<Directory /var/www/html/>"                      ; \
    echo "    Options -Indexes"                            ; \
    echo "    AllowOverride All"                           ; \
    echo "</Directory>"                                    ; \
} | tee "/etc/httpd/conf.d/docker-php.conf"

RUN { \
    echo "opcache.memory_consumption=128"     ; \
    echo "opcache.interned_strings_buffer=8"  ; \
    echo "opcache.max_accelerated_files=4000" ; \
    echo "opcache.revalidate_freq=60"         ; \
    echo "opcache.fast_shutdown=1"            ; \
    echo "opcache.enable_cli=1"               ; \
} | tee "/etc/php.d/opcache-recommended.ini"


WORKDIR /var/www/html

# https://www.drupal.org/node/3060/release
RUN curl https://ftp.drupal.org/files/projects/drupal-8.2.1.tar.gz | tar -xz --strip-components=1 \
 && curl https://s3.amazonaws.com/files.drush.org/drush.phar -o /usr/local/bin/drush \
 && curl https://getcomposer.org/download/1.2.1/composer.phar -o /usr/local/bin/composer \
 && chown -R apache:apache /var/www/html \
 && chmod 755 /usr/local/bin/drush /usr/local/bin/composer

ENTRYPOINT ["/usr/sbin/httpd"]
CMD ["-k", "start", "-DFOREGROUND"]
