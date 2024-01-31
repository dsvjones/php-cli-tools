FROM php:cli-alpine

RUN apk update && apk upgrade
RUN apk add --no-cache $PHPIZE_DEPS  \
        bash icu-dev curl libzip-dev imap-dev openssl php-openssl gd

WORKDIR /home/www-data

RUN docker-php-ext-install gd
RUN docker-php-ext-configure intl && docker-php-ext-install intl
RUN docker-php-ext-install zip
RUN docker-php-ext-configure imap && docker-php-ext-install imap

RUN curl -1sLf 'https://dl.cloudsmith.io/public/symfony/stable/setup.alpine.sh' | bash
RUN apk add symfony-cli

COPY php.ini /usr/local/etc/php/php.ini
    
COPY --from=composer/composer:latest-bin /composer /usr/bin/composer