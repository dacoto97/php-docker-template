FROM php:7.4-fpm-alpine

WORKDIR /var/www

RUN apk --update upgrade \
    && apk add --no-cache autoconf automake make gcc g++ icu-dev libpng-dev libzip-dev \
    && docker-php-ext-install bcmath \
        intl \
        zip \
        gd \
        json \
        mysqli \
        pdo_mysql

RUN curl -sS https://getcomposer.org/installer | php
RUN mv composer.phar /usr/local/bin/composer

COPY php/ /usr/local/etc/php/
