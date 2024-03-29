FROM alpine:3.19

RUN apk add curl git

# PHP + extensions de Symfony
RUN apk add php82 php82-ctype php82-iconv pcre2 php82-session php82-simplexml php82-tokenizer

# Extensions supplémentaires ex: Doctrine
RUN apk add php82-mbstring php82-posix php82-intl php82-fpm php82-pdo_pgsql

# Composer (dépendances)
RUN apk add php82-phar php82-openssl php82-xml php82-dom

# Install composer
RUN curl 'https://getcomposer.org/installer' | php -- --install-dir=bin --filename=composer

# Install symfony
RUN curl -1sLf 'https://dl.cloudsmith.io/public/symfony/stable/setup.alpine.sh' | /bin/sh 

RUN apk add symfony-cli

# Vérif  si tout est ok (dépendances)
RUN symfony check:requirements

# skeleton projet symfony
RUN composer create-project symfony/skeleton app

WORKDIR /app

ENV COMPOSER_ALLOW_SUPERUSER=1

# Webapp
RUN composer require webapp

CMD symfony server:start