#!/bin/bash
set -e

if [[ "$1" = "firstrun" ]] || [[ ! -f storage/settings.json ]];  then
  echo "running first time setup!"
  cd /var/www/html
  rm -rf storage/*
  cp -R storage_orig/* storage/

  echo "APP_KEY=" > storage/env.docker

  ln -s storage/env.docker .env
  echo "\$ php artisan key:generate --force"
  php artisan key:generate --force
  echo "\$ php artisan migrate --seed --force"
  php artisan migrate --seed --force
else
  ln -s storage/env.docker .env
fi

/usr/bin/supervisord -n -c /etc/supervisor/supervisord.conf
