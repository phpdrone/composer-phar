#!/bin/sh
set +x
echo "Backing up vendor directory ..."
[ -d vendor ] && cp vendor ../vendor -R
echo "Moving away non-dist material ..."
[ -d .git ] && mv .git ../.git
[ -f .drone.yml ] && mv .drone.yml ../.drone.yml
echo "Installing mininal components ..."
composer install --no-dev
echo "Building PHAR file ..."
phar-composer build ${PLUGIN_COMPOSER_JSON} ${PLUGIN_OUTPUT}
echo "Restoring state ..."
rm -Rf vendor
[ -d ../vendor ] && mv ../vendor vendor
[ -d ../.git ] && mv ../.git .git
[ -f ../.drone.yml ] && mv ../.drone.yml .drone.yml
