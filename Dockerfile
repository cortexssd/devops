FROM php:8.1-fpm

RUN apt-get update && apt-get install -y \
    libpq-dev \
    git \
    unzip \
    libzip-dev \
    && docker-php-ext-install pdo pdo_pgsql zip \
    && pecl install redis \
    && docker-php-ext-enable redis \
    && curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

WORKDIR /var/www/html

COPY . .

CMD ["sh", "-c", "if [ ! -d /var/www/html/vendor ]; then composer install --no-dev --optimize-autoloader --no-interaction; fi && php-fpm"]
