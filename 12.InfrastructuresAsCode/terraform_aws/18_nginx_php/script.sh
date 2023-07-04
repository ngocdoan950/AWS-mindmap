#!/bin/bash
sudo su
yum update -y
amazon-linux-extras install nginx1 -y
amazon-linux-extras enable php8.0
yum clean metadata
yum install php php-cli php-mysqlnd php-pdo php-common php-fpm -y
yum install php-gd php-mbstring php-xml php-dom php-intl php-simplexml -y
systemctl enable nginx
systemctl enable php-fpm
cp /home/ec2-user/phpsite.conf /etc/nginx/conf.d/
mv /home/ec2-user/phpsite /var/www/
service nginx start
service php-fpm start