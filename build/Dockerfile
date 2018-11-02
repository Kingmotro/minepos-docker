# use the cli argument "--build-arg version=<value>" to build a version other than master
ARG version=master

# Doing this separate allows us to cache the composer dependencies when rebuilding.

FROM php:7-fpm-alpine as webfiles
ARG version
RUN chown -R www-data:www-data /var/www
USER www-data
WORKDIR /var/www/html
RUN curl -L -o /tmp/minepos.tar.gz https://github.com/MinePoS/Backend/archive/$version.tar.gz
#COPY $version.tar.gz /tmp/minepos.tar.gz
RUN tar -xvzf /tmp/minepos.tar.gz -C /var/www/html --strip-components=1
RUN curl --silent --show-error https://getcomposer.org/installer | php && php composer.phar install --ignore-platform-reqs
RUN cp -R storage storage_orig

FROM php:7.1.13-fpm

MAINTAINER FNAME LNAME <EMAIL@MAIL.TLD>

RUN export DEBIAN_FRONTEND=noninteractive; apt-get update; apt-get install -y supervisor nginx autoconf pkg-config libssl-dev  git zip libpng-dev libxml2-dev
RUN docker-php-ext-install   pdo_mysql gd mbstring bcmath  zip # bcmath xml pdo


# Add Configuration files for all programs
ADD files /

# install minepos
#RUN chown -R www-data:www-data /var/www
USER www-data
WORKDIR /var/www/html
COPY --from=webfiles --chown=www-data:www-data /var/www/html /var/www/html
RUN  chmod -R 755 /var/www/html/storage/* /var/www/html/bootstrap/cache /var/www/html/public/*




ENV APP_NAME=MinePOS \
  APP_DEBUG=true \
  APP_URL=http://localhost \
  LOG_CHANNEL=stack \
  DB_CONNECTION=mysql \
  DB_HOST= \
  DB_PORT=3306 \
  DB_DATABASE=minepos \
  DB_USERNAME=minepos \
  DB_PASSWORD= \
  BROADCAST_DRIVER=log \
  CACHE_DRIVER=file \
  SESSION_DRIVER=file \
  SESSION_LIFETIME=120 \
  QUEUE_DRIVER=sync \
  REDIS_HOST=127.0.0.1 \
  REDIS_PASSWORD=null \
  REDIS_PORT=6379 \
  MAIL_DRIVER= \
  MAIL_HOST= \
  MAIL_PORT= \
  MAIL_USERNAME= \
  MAIL_PASSWORD= \
  MAIL_ENCRYPTION= \
  PUSHER_APP_ID= \
  PUSHER_APP_KEY= \
  PUSHER_APP_SECRET= \
  PUSHER_APP_CLUSTER=mt1 \
  MIX_PUSHER_APP_KEY="${PUSHER_APP_KEY}" \
  MIX_PUSHER_APP_CLUSTER="${PUSHER_APP_CLUSTER}"

VOLUME ["/var/www/html/storage", "/var/www/html/config"]

USER root
# Cleanup

apt-get clean autoclean
apt-get autoremove --yes
rm -rf /var/lib/{apt,dpkg,cache,log}/


RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
