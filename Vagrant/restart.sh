a2enmod proxy_fcgi
a2dissite 000-default
a2ensite wordpress
service apache2 restart
systemctl restart php7.0-fpm
