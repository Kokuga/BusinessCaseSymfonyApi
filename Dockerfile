FROM php:7.4-apache

ADD https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions /usr/local/bin/
RUN set -xe \
    && chmod +x /usr/local/bin/install-php-extensions && sync \
    && install-php-extensions \
        mysqli \
        pdo_mysql \
        gettext \
        @composer

COPY . /var/www/html/
RUN composer install
