# !/bin/bash
echo "setting up apache2 server"

systemctl enable apache2

mkdir -p /var/www/aidan.com/html
chown -R $USER:$USER /var/www/aidan.com/html
chmod -R 755 /var/www/aidan.com
mv apache/index.html > /var/www/aidan.com/html/index.html
mv apache/style.css > /var/www/aidan.com/html/style.css
mv apache/app.js > /var/www/aidan.com/html/app.js
echo "<VirtualHost *:80>
    ServerAdmin admin@example.com
    ServerName example.com
    ServerAlias www.example.com
    DocumentRoot /var/www/example.com/html
    ErrorLog ${APACHE_LOG_DIR}/error.log
    CustomLog ${APACHE_LOG_DIR}/access.log combined
</VirtualHost>" > /etc/apache2/sites-available/aidan.com.conf
a2ensite aidan.com.conf
a2dissite 000-default.conf
apache2ctl configtest
systemctl restart apache2