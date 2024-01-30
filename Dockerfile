FROM php:cli-alpine

RUN apk update && apk upgrade
RUN apk add --no-cache $PHPIZE_DEPS  \
        bash \
        icu-dev \
        curl

WORKDIR /home/www-data

RUN docker-php-ext-install opcache
RUN docker-php-ext-configure intl && docker-php-ext-install intl

RUN curl -1sLf 'https://dl.cloudsmith.io/public/symfony/stable/setup.alpine.sh' | bash
RUN apk add symfony-cli

COPY php.ini-development /usr/local/etc/php/php.ini
COPY php-opcache.ini /usr/local/etc/php/conf.d/opcache.ini
    
COPY --from=composer/composer:latest-bin /composer /usr/bin/composer