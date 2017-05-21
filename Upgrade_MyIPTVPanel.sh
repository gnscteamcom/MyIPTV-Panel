#!/bin/bash
##############################################################################
#### Upgrade - MyIPTV Panel
## 
## This program is distributed in the hope that it will be useful,
##   but WITHOUT ANY WARRANTY;
## 
####
##############################################################################


### Remove Panel ###
cd /var/www
sudo cp -R myiptv/ myiptv_bak/
sudo rm -R myiptv/
##############################################################################
### Download Panel ###
sudo echo 'Download the Panel'
cd /var/www/
git clone https://cbazone@bitbucket.org/cbazone/myiptv.git
##############################################################################
### Configurations ###
## Auth ##
sudo echo 'Configure the authorizations'
sudo echo 'www-data ALL=(ALL) NOPASSWD: /usr/bin/vlc' >> /etc/sudoers
sudo echo 'www-data ALL=(ALL) NOPASSWD: /usr/bin/cvlc' >> /etc/sudoers
sudo echo 'www-data ALL=(ALL) NOPASSWD: /usr/bin/ffmpeg' >> /etc/sudoers
cd /var/www/
chown -R www-data myiptv
chgrp -R www-data myiptv

## Apache ##
cp -R /var/www/myiptv/install/000-default.conf /etc/apache2/sites-available/000-default.conf
sudo a2enmod rewrite
sudo service apache2 restart

## Panel ##
sudo echo 'Configure the Panel'
cd /var/www/myiptv/config
sudo cp config_template.php config.php
##############################################################################
