#!/bin/bash
##############################################################################
## AutoInstall - MyIPTV Panel
## 
## This program is distributed in the hope that it will be useful,
##   but WITHOUT ANY WARRANTY;
## 
##
##############################################################################

#Add needed repositories
sudo echo 'Add needed repositories'
sudo add-apt-repository ppa:mc3man/trusty-media
##############################################################################
# Update
sudo echo 'Update packages information'
sudo apt-get update
##############################################################################
# Install packages
sudo echo 'Install the packages'
sudo apt-get install apache2 apache2-utils
sudo apt-get install php5 php5-cli
sudo a2enmod rewrite
sudo apt-get install php5-sqlite
sudo apt-get install git
sudo apt-get install ffmpeg
sudo apt-get install vlc
sudo visudo
##############################################################################
#php5-FPM configuration
sudo apt-get install libapache2-mod-fastcgi, php5-fpm apache2-mpm-worker
a2dismod php5 mpm_prefork
a2enmod mpm_worker
a2enmod proxy
a2enmod proxy_fcgi
a2enmod actions
apache2 -v
##############################################################################
# Download Panel
sudo echo 'Download the Panel'
cd /var/www/
git clone https://cbazone@bitbucket.org/cbazone/myiptv.git
##############################################################################
# Configurations
# Auth
sudo echo 'Configure the authorizations'
sudo echo 'www-data ALL=(ALL) NOPASSWD: /usr/bin/vlc' >> /etc/sudoers
sudo echo 'www-data ALL=(ALL) NOPASSWD: /usr/bin/cvlc' >> /etc/sudoers
sudo echo 'www-data ALL=(ALL) NOPASSWD: /usr/bin/ffmpeg' >> /etc/sudoers
cd /var/www/
chown -R www-data myiptv
chgrp -R www-data myiptv
##############################################################################
# Apache
sudo echo 'Configure the Apache WebServer'
rm /etc/apache2/sites-available/000-default.conf
cd /etc/apache2/sites-available/ && wget http://raw.githubusercontent.com/marconimp/MyIPTV-Panel/master/000-default.conf
##############################################################################
# My IP : config_template.php , config.php
rm /var/www/myiptv/config/config_template.php
cd /var/www/myiptv/config/ && wget http://raw.githubusercontent.com/marconimp/MyIPTV-Panel/master/config_template.php
##############################################################################
# My IP : config_template.php , config.php
rm /var/www/myiptv/config/config.php
cd /var/www/myiptv/config/ && wget http://raw.githubusercontent.com/marconimp/MyIPTV-Panel/master/config.php
##############################################################################
rm /etc/apache2/mods-enabled/fastcgi.conf
cd /etc/apache2/mods-enabled/ && wget http://raw.githubusercontent.com/marconimp/MyIPTV-Panel/master/fastcgi.conf
##############################################################################
wget -O /etc/apache2/apache2.conf http://raw.githubusercontent.com/marconimp/MyIPTV-Panel/master/apache2.conf
##############################################################################
# Restart Apache and php5-fpm
service apache2 reload && service apache2 restart
service php5-fpm restart
##############################################################################
echo "<?php phpinfo(); ?>" > /var/www/myiptv/webroot/info.php
