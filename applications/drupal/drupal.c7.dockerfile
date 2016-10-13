FROM centos:latest

LABEL \
    BASE_OS="CentOS 7" \
    DEFAULT_IMAGE="cbiitss/drupal" \
    DEFAULT_TAG="8.2" \
    DESCRIPTION="CentOS 7 / PHP 7.0 / Drupal 8.2" \
    VERSION="1.0" \
    UID="CBIITSS_DRUPAL_8.2"

RUN yum -y install https://centos7.iuscommunity.org/ius-release.rpm \
 && yum -y update \
 && yum -y install \
    httpd24u \
    httpd24u-mod_ssl \
    mod_php70u \
    php70u-cli \
    php70u-common \
    php70u-fpm \
    php70u-fpm-httpd \
    php70u-opcache \
    php70u-pdo \
 && yum clean all