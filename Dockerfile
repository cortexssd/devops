FROM php:8.1-fpm

RUN apt-get update && apt-get install -y \
    libpq-dev \
    unzip \
    libzip-dev \
    && docker-php-ext-install pdo pdo_pgsql zip


RUN pecl install redis && docker-php-ext-enable redis

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

WORKDIR /var/www/html
COPY composer.json .
RUN composer install --no-dev --optimize-autoloader --no-interaction

COPY . .


