FROM php:7.2

RUN apt-get update && \
    apt-get install --no-install-recommends -y \
    git \
    libcurl4-gnutls-dev \
    libicu-dev \
    libmcrypt-dev \
    libvpx-dev \
    libjpeg-dev \
    libpng-dev \
    libxpm-dev \
    zlib1g-dev \
    libfreetype6-dev \
    libxml2-dev \
    libexpat1-dev \
    libbz2-dev \
    libgmp3-dev \
    libldap2-dev \
    unixodbc-dev \
    libpq-dev \
    libsqlite3-dev \
    libaspell-dev \
    libsnmp-dev \
    libpcre3-dev \
    libtidy-dev -yqq

RUN docker-php-ext-install \
    mbstring \
    pdo_mysql \
    curl \
    json \
    intl \
    gd \
    xml \
    zip \
    bz2 \
    opcache

RUN pecl install -o -f redis

RUN docker-php-ext-enable redis

RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" && \
    php composer-setup.php && \
    mv composer.phar /usr/local/bin/composer && \
    php -r "unlink('composer-setup.php');"
