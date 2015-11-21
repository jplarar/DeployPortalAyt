#!/usr/bin/env bash

echo --- Pull the most recent configuration files ---
git stash
git pull
if [ $? -gt 0 ]; then
    chmod +x update.sh
    echo "Update stopped. Could not pull from remote repository."
else

echo - Update packages with composer -
php composer.phar self-update
 php composer.phar update # bug

echo - Fix permissions -
 chmod 755 -R app/logs

echo - Clear cache -
 chmod 755 -R app/cache
 php app/console cache:clear --env=prod # bug
 chmod 755 -R app/cache

echo - Update database -
php app/console doctrine:schema:update --force

fi