FROM php:7.3

RUN apt-get update && \
    apt-get -y install git libicu-dev libonig-dev libzip-dev unzip locales && \
    apt-get clean
RUN docker-php-ext-install intl pdo_mysql zip bcmath

WORKDIR /app

COPY index.php index.php