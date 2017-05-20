#!/bin/bash
echo " "
echo -e "${jeshile} ┌───────────────────────────┐ \e[0m"
echo -e "${jeshile} │   Installing Web Server   │ \e[0m"
echo -e "${jeshile} └───────────────────────────┘ \e[0m"
echo " "
apt-get update && apt-get upgrade -y && apt-get install htop -y
echo " "
#Install Apache
apt-get install apache2 apache2-mpm-prefork apache2-utils libapache2-mod-php5 libapr1 libaprutil1 libdbd-mysql-perl libdbi-perl libnet-daemon-perl libplrpc-perl libpq5 mysql-client-5.5 mysql-common mysql-server mysql-server-5.5 php5-common php5-mysql -y
apt-get install phpmyadmin -y
#Install PHP
sudo apt-get install php5-dev php5-gd -y
apt-get install php5-geoip php5-fpm mcrypt php5-mcrypt php5enmod mcrypt -y
apt-get install lsb-release nscd curl php5 php5-mysql php5-cli php5-curl unzip curl libcurl3 libcurl3-dev php5-curl -y
#Enable RewritingMod
sudo a2enmod rewrite
#Enable support for SQLlite3
sudo apt-get install php5-sqlite
#Install git
sudo apt-get install git
#Install FFmpeg 2.3.3
sudo add-apt-repository ppa:mc3man/trusty-media
sudo apt-get update
sudo apt-get install ffmpeg
#Install VLC
sudo apt-get install vlc
sudo apt-get update && sudo apt-get install vlc vlc-plugin-* -y && sudo apt-get install vlc browser-plugin-vlc -y
echo " "
sudo visudo
echo " "
sudo apt-get update
echo " "
# Download Panel
cd /var/www/
git clone https://cbazone@bitbucket.org/cbazone/myiptv.git
echo " "
chown -R www-data myiptv
chgrp -R www-data myiptv
echo " "
wget -O /etc/apache2/apache2.conf http://raw.githubusercontent.com/marconimp/MyIPTV-Panel/master/apache2.conf
echo " "
sudo apt-get update
#php5-FPM configuration
apt-get install libapache2-mod-fastcgi, php5-fpm apache2-mpm-worker
a2dismod php5 mpm_prefork
a2enmod mpm_worker
a2enmod proxy
a2enmod proxy_fcgi
a2enmod actions
apache2 -v
echo " "
rm  /var/www/html/index.html
echo " "
rm /etc/apache2/sites-available/000-default.conf
cd /etc/apache2/sites-available/ && wget http://raw.githubusercontent.com/marconimp/MyIPTV-Panel/master/000-default.conf
echo " "
rm /var/www/myiptv/config/config_template.php
cd /var/www/myiptv/config/ && wget http://raw.githubusercontent.com/marconimp/MyIPTV-Panel/master/config_template.php
echo " "
sudo apt-get update
#Restart Apache and php5-fpm
service apache2 reload && service apache2 restart
service php5-fpm restart
