FROM php:cli-alpine

RUN apk update && apk upgrade
RUN apk add --no-cache $PHPIZE_DEPS  \
        bash \
        icu-dev \
        curl

WORKDIR /home/www-data

RUN docker-php-ext-configure intl && docker-php-ext-install intl

RUN curl -1sLf 'https://dl.cloudsmith.io/public/symfony/stable/setup.alpine.sh' | bash
RUN apk add symfony-cli

COPY php.ini /usr/local/etc/php/php.ini
    
COPY --from=composer/composer:latest-bin /composer /usr/bin/composer