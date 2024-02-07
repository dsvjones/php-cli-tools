FROM php:8.2.15-cli

RUN apt update && apt upgrade

RUN apt install -y zlib1g-dev libpng-dev libicu-dev libzip-dev zip

RUN docker-php-ext-configure gd && docker-php-ext-install gd
RUN docker-php-ext-configure intl && docker-php-ext-install intl
RUN docker-php-ext-install zip
RUN docker-php-ext-install exif
RUN docker-php-ext-install opcache

RUN rm -rf /usr/src/php/*

RUN wget https://get.symfony.com/cli/install -O - | bash

COPY ./conf/php.ini /usr/local/etc/php/php.ini
# COPY conf/opcache.ini /usr/local/etc/php/conf.d/opcache.ini
   
COPY --from=composer/composer:latest-bin /composer /usr/bin/composer