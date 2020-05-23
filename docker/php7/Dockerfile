FROM php:7.3.15-apache-stretch
LABEL maintainer="Fabian Peter <fabian@peter.saarland>"

ENV COMPOSER_HOME=/usr/local/bin/composer
ENV WEB_DOCUMENT_ROOT=/var/www/html

RUN apt-get update \
    && apt-get install -y --no-install-recommends socat git-all libzip-dev unzip zlib1g-dev libicu-dev g++ libxml2 libxml2-dev libpng-dev jpegoptim imagemagick optipng pngcrush libjpeg-progs libwebp-dev libjpeg62-turbo-dev libfreetype6-dev dnsutils \
    && rm -rf /var/lib/apt/lists/* \
    && pecl install -o -f redis \
    &&  rm -rf /tmp/pear \
    &&  docker-php-ext-enable redis \
    && docker-php-ext-install -j$(nproc) zip \
    && docker-php-ext-install -j$(nproc) pdo_mysql \
    && docker-php-ext-configure intl \
    && docker-php-ext-install -j$(nproc) intl \ 
    && docker-php-ext-install -j$(nproc) xmlrpc \ 
    && docker-php-ext-configure gd --with-freetype-dir=/usr --with-jpeg-dir=/usr --with-png-dir=/usr \ 
    && docker-php-ext-install -j$(nproc) gd \ 
    && docker-php-ext-install -j$(nproc) opcache \ 
    && pecl install xdebug \
    && docker-php-ext-enable xdebug \
    && pecl install apcu \
    && docker-php-ext-enable apcu \
    && a2enmod rewrite


WORKDIR /tmp
RUN curl -fsSL 'https://downloads.ioncube.com/loader_downloads/ioncube_loaders_lin_x86-64.tar.gz' -o ioncube.tar.gz \ 
    && mkdir -p /tmp/ioncube \ 
    && tar -xvvzf ioncube.tar.gz \ 
    && mv ioncube/ioncube_loader_lin_7.3.so `php-config --extension-dir` \ 
    && rm -Rf ioncube.tar.gz ioncube \ 
    && docker-php-ext-enable ioncube_loader_lin_7.3
    #&& curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# install png out
RUN curl -fsSL http://static.jonof.id.au/dl/kenutils/pngout-20150319-linux.tar.gz -o pngout-20150319-linux.tar.gz \
        && tar -xf pngout-20150319-linux.tar.gz \
        && rm pngout-20150319-linux.tar.gz \
        && cp pngout-20150319-linux/x86_64/pngout /bin/pngout \
        && rm -rf pngout-20150319-linux
COPY php-config.ini "$PHP_INI_DIR/conf.d/shopware.ini"
COPY opcache.ini "$PHP_INI_DIR/conf.d/opcache.ini"
#COPY xdebug.ini /usr/local/etc/php/conf.d/

COPY docker-entrypoint.sh /docker-entrypoint.sh

# https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=863199
RUN chmod +x /docker-entrypoint.sh \
    && mkdir -p /usr/share/man/man1 \
    && chmod 0755 /var/www/html -R

WORKDIR /var/www/html

RUN rm -rf * \
    && curl -fsSL http://releases.s3.shopware.com/Downloader/index.php -o index.php
COPY config_production.php /var/www/html/config_production.php

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["apache2-foreground"]