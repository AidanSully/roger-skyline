# !/bin/bash
echo "setting up apache2 server"

systemctl enable apache2

mkdir -p /var/www/aidan.com/html
chown -R $USER:$USER /var/www/aidan.com/html
chmod -R 755 /var/www/aidan.com
echo "<VirtualHost *:80>
    ServerAdmin admin@example.com
    ServerName example.com
    ServerAlias www.example.com
    DocumentRoot /var/www/example.com/html
    ErrorLog ${APACHE_LOG_DIR}/error.log
    CustomLog ${APACHE_LOG_DIR}/access.log combined
</VirtualHost>" > /etc/apache2/sites-available/aidan.com.conf
mv /etc/apache2/sites-available/aidan.com.conf > /etc/apache2/sites-available/000-default.conf
apache2ctl configtest
systemctl restart apache2
openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/apache-selfsigned.key -out /etc/ssl/certs/apache-selfsigned.crt
mv ssl/ssl-params.conf > /etc/apache2/conf-available/ssl-params.conf
cp /etc/apache2/sites-available/default-ssl.conf /etc/apache2/sites-available/default-ssl.conf.bak
mv ssl/000-default.conf /etc/apache2/sites-available/000-default.conf
a2enmod ssl
a2enmod headers
a2ensite default-ssl
a2enconf ssl-params
apache2ctl configtest
systemctl restart apache2