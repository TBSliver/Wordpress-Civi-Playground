#! /bin/bash

CIVI_VER="4.7.27"

cd /home/ubuntu

echo "Getting CiviCRM Install Files"
wget --quiet https://download.civicrm.org/civicrm-$CIVI_VER-wordpress.zip
wget --quiet https://download.civicrm.org/civicrm-$CIVI_VER-l10n.tar.gz

wp core download --path=wordpress

unzip -qq civicrm-$CIVI_VER-wordpress.zip \
  -d /home/ubuntu/wordpress/wp-content/plugins \

cp /vagrant/wp-cli-config.yml /home/ubuntu/wordpress/wp-cli.yml

cd /home/ubuntu/wordpress
wp config create --dbname=wordpress --dbuser=root --dbpass=abc123
wp db create
wp core install \
  --url=192.168.34.11 \
  --title="Wordpress Dev Stuff" \
  --admin_user=admin \
  --admin_password=admin \
  --admin_email=ubuntu@127.0.0.1

wp civicrm install \
  --dbhost=localhost \
  --dbname=civicrm \
  --dbuser=root \
  --dbpass=abc123 \
  --lang=en_GB \
  --langtarfile=/home/ubuntu/civicrm-$CIVI_VER-l10n.tar.gz \
  --site_url=192.168.34.11 \
  --ssl=off

exit 0
