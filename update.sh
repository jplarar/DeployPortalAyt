#!/usr/bin/env bash
echo - Update packages with composer -
php composer.phar self-update
 php composer.phar update # bug

echo - Fix permissions -
 chmod 777 -R app/logs

echo - Clear cache -
 chmod 777 -R app/cache
 php app/console cache:clear --env=prod # bug
 chmod 777 -R app/cache

echo - Update database -
php app/console doctrine:schema:update --force