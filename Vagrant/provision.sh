#/bin/bash

export DEBIAN_FRONTEND=noninteractive
cat /vagrant/debconf-mysql.conf | debconf-set-selections
apt-get update
apt-get -y install \
  php \
  mysql-server \
  mysql-client \
  apache2 \
  php-mysql \
  php-fpm \
  php-xml \
  language-pack-en \
  unzip

wget --quiet https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp

cp /vagrant/fpm-wordpress.conf /etc/php/7.0/fpm/pool.d/wordpress.conf
cp /vagrant/apache-wordpress.conf /etc/apache2/sites-available/wordpress.conf
