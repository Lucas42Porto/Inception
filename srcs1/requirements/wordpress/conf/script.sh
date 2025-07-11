#!/bin/bash
if [ -f "/var/www/html/wordpress/wp-config.php" ]

then
  echo "Wordpress already configured."

else
cd /var/www/html
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
sleep 5
mv wp-cli.phar /usr/bin/wp

wp core download --allow-root
wp config create --dbname=${DB_NAME} \
                  --dbuser=${DB_USER} \
                  --dbpass=${DB_PASSWORD} \
                  --dbhost=mariadb --allow-root
                  
wp core install --url=${SERVER_NAME} \
                  --title=inception \
                  --admin_user=${WP_ADMIN_USER} \
                  --admin_password=${WP_ADMIN_PASSWORD} \
                  --admin_email=${WP_ADMIN_EMAIL} --allow-root

wp user create ${WP_USER} ${WP_EMAIL} --user_pass=${WP_PASSWORD} --role=subscriber --allow-root



fi
php-fpm7.4 -F
