FROM php:8.2.15-cli

RUN apt update && apt upgrade

RUN apt install -y zlib1g-dev libpng-dev libicu-dev libzip-dev zip wget curl libc-client-dev libkrb5-dev

RUN docker-php-ext-configure gd && docker-php-ext-install gd && docker-php-ext-install exif
RUN docker-php-ext-configure intl && docker-php-ext-install intl && docker-php-ext-install zip 
RUN docker-php-ext-install opcache
RUN docker-php-ext-configure imap --with-kerberos --with-imap-ssl \
    && docker-php-ext-install imap \
    && docker-php-ext-enable imap

RUN rm -rf /usr/src/php/*

RUN curl -1sLf 'https://dl.cloudsmith.io/public/symfony/stable/setup.deb.sh' | bash
RUN apt install -y symfony-cli

COPY ./conf/php.ini /usr/local/etc/php/php.ini
COPY ./conf/opcache.ini /usr/local/etc/php/conf.d/opcache.ini
   
COPY --from=composer/composer:latest-bin /composer /usr/bin/composer