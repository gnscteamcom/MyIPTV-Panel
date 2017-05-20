#!/bin/bash
##############################################################################
#### AutoInstall - MyIPTV Panel
## 
## This program is distributed in the hope that it will be useful,
##   but WITHOUT ANY WARRANTY;
## 
####
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
sudo apt-get install apache2 apache2-utils php5 php5-cli php5-sqlite git ffmpeg vlc 
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
sudo a2enmod rewrite
sudo service apache2 restart
##############################################################################
# Panel
rm /var/www/myiptv/config/config_template.php
cd /var/www/myiptv/config/ && wget http://raw.githubusercontent.com/marconimp/MyIPTV-Panel/master/config_template.php
rm /var/www/myiptv/config/config.php
cd /var/www/myiptv/config/ && wget http://raw.githubusercontent.com/marconimp/MyIPTV-Panel/master/config.php
##############################################################################
