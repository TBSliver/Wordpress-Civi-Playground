#! /bin/bash

cd /home/ubuntu

wp core download --path=wordpress --locale=en_GB

cp /vagrant/wp-cli-config.yml /home/ubuntu/wp-cli.yml

cd /home/ubuntu/wordpress
wp config create --dbname=wordpress --dbuser=root --dbpass=abc123
wp db create
wp core install \
  --url=192.168.34.11 \
  --title="Wordpress Dev Stuff" \
  --admin_user=admin \
  --admin_password=admin \
  --admin_email="ubuntu@example.com" \
  --skip-email

exit 0
