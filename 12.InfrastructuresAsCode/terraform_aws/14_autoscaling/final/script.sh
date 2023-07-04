#!/bin/bash
sudo su  # Thêm dòng này
yum update -y
amazon-linux-extras install -y lamp-mariadb10.2-php7.2 php7.2
yum install -y httpd mariadb-server
systemctl enable httpd
service httpd start
usermod -a -G apache ec2-user
chown -R ec2-user:apache /var/www
chmod 2775 /var/www
find /var/www -type d -exec chmod 2775 {} \;
find /var/www -type f -exec chmod 0664 {} \;
cd /var/www/html
echo 'Public host name:<b> ' `wget -q -O - http://169.254.169.254/latest/meta-data/public-hostname` '</b><br>' > index.html
echo 'Public IPv4:<b> ' `wget -q -O - http://169.254.169.254/latest/meta-data/public-ipv4` '</b><br>' >> index.html
echo 'Instance id:<b> ' `wget -q -O - http://169.254.169.254/latest/meta-data/instance-id` '</b><br>' >> index.html
echo  'Avalibility Zone: <b>' `wget -q -O - http://169.254.169.254/latest/meta-data/placement/availability-zone` '</b><br>' >> index.html

curl https://raw.githubusercontent.com/hashicorp/learn-terramino/master/index.php -O