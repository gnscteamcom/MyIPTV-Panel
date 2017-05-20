#!/bin/bash
echo " "
jeshile='\e[40;38;5;82m' #jeshile
jo='\e[0m' # pa ngjyra
os=$(exec uname -m|grep 64)
if [ "$os" = "" ]
then os="x86"
else os="x64"
fi
echo -e "${jeshile} ┌───────────────────────────┐ \e[0m"
echo -e "${jeshile} │  Checking System Version  │ \e[0m"
echo -e "${jeshile} └───────────────────────────┘ \e[0m"
sleep 3
echo -e "${jeshile} ┌───────────────────────────┐ \e[0m"
echo -e "${jeshile} │   Detected a $os System   │ \e[0m"
echo -e "${jeshile} └───────────────────────────┘ \e[0m"
sleep 3
echo -e "${jeshile} ┌───────────────────────────┐ \e[0m"
echo -e "${jeshile} │   Installing Web Server   │ \e[0m"
echo -e "${jeshile} └───────────────────────────┘ \e[0m"
echo " "
apt-get update && apt-get upgrade -y && apt-get install htop -y
apt-get install lsb-release nscd curl php5 php5-mysql php5-cli php5-curl unzip curl libcurl3 libcurl3-dev php5-curl -y
sudo apt-get update && sudo apt-get install vlc vlc-plugin-* -y && sudo apt-get install vlc browser-plugin-vlc -y
sudo wget https://yt-dl.org/downloads/latest/youtube-dl -O /usr/local/bin/youtube-dl && chmod a+rx /usr/local/bin/youtube-dl
sudo updatedb
sudo apt-get update
sudo apt-get install php5-dev php5-gd -y
apt-get install php5-geoip php5-fpm mcrypt php5-mcrypt php5enmod mcrypt -y
apt-get install apache2 apache2-mpm-prefork apache2-utils libapache2-mod-php5 libapr1 libaprutil1 libdbd-mysql-perl libdbi-perl libnet-daemon-perl libplrpc-perl libpq5 mysql-client-5.5 mysql-common mysql-server mysql-server-5.5 php5-common php5-mysql -y
apt-get install phpmyadmin -y
sudo php5enmod mcrypt
service apache2 reload && service apache2 restart
echo " "
echo " "
echo -e "${jeshile} ┌──────────────────────────────────────────┐ \e[0m"
echo -e "${jeshile} │  Downloanding Extracting And Installing  │ \e[0m"
echo -e "${jeshile} └──────────────────────────────────────────┘ \e[0m"
echo " "
#mkdir /var/www/html
#cd /var/www/html #DESTINACIONI KRYESOR ADMIN - TEMPLATES ETC
cd /var/www/html && wget https://www.dropbox.com/s/2is9fp9c2x7q80v/Xtream_Codes_v1.0.60_Nulled.zip && unzip Xtream_Codes_v1.0.60_Nulled.zip && cp /var/www/html/downloads/iptv_panel_pro.zip /tmp && chmod a+x /tmp/iptv_panel_pro.zip && cp /var/www/html/downloads/install_iptv_pro.php /root/ && cd /root && chmod a+x /root/install_iptv_pro.php && php install_iptv_pro.php
chmod 775 /var/www/html/Xtream_Codes_v1.0.60_Nulled.zip
rm /var/www/html/Xtream_Codes_v1.0.60_Nulled.zip
cp /var/www/html/downloads/iptv_panel_pro.zip /tmp
chmod a+x /tmp/iptv_panel_pro.zip
#cp /var/www/html/downloads/install_iptv_pro.php /root/ #FSHIHET AUTOMATIKISHT MBAS INSTALIMIT
#cd /root
#chmod a+x /root/install_iptv_pro.php
#php install_iptv_pro.php  #KJO ESHTE LULKUQJA
echo " "
#REPLACE CONFIG, ALL ORIGINAL FILES ARE BACKUP WITH END backup_by_TRC4
echo -e "${jeshile} ┌─────────────────────────────────────────┐ \e[0m"
echo -e "${jeshile} │  Replacing Original With Cracked Files  │ \e[0m"
echo -e "${jeshile} └─────────────────────────────────────────┘ \e[0m"
echo " "
cp /etc/init.d/xtreamcodes_pro_panel /etc/init.d/xtreamcodes_pro_panel_backup_by_TRC4
echo -e "${jeshile} [+] /etc/init.d/xtreamcodes_pro_panel Backup as xtreamcodes_pro_panel_backup_by_TRC4 \e[0m"
cp /var/www/html/crack/xtreamcodes_pro_panel /etc/init.d/xtreamcodes_pro_panel
echo -e "${jeshile} [+] New xtreamcodes_pro_panel File Coppied to /etc/init.d/xtreamcodes_pro \e[0m"
cp /etc/rc.local /etc/rc.local_backup_by_TRC4
echo -e "${jeshile} [+] /etc/rc.local backuped as rc.local_backup_by_TRC4 \e[0m"
cp /var/www/html/crack/rc.local /etc/rc.local
echo -e "${jeshile} [+] New rc.local File Coppied to /etc/rc.local \e[0m"
chmod +x /etc/rc.local
echo -e "${jeshile} [+] chmod +x rc.local \e[0m"
echo " "
#MYSQL CONFIG, ALL ORIGINAL FILES ARE BACKUP WITH END backup_by_TRC4
echo -e "${jeshile} ┌──────────────────────────────┐ \e[0m"
echo -e "${jeshile} │  Modified MYSQL Connections  │ \e[0m"
echo -e "${jeshile} └──────────────────────────────┘ \e[0m"
echo " "
cp /etc/mysql/my.cnf /etc/mysql/my_config.cnf_backup_by_TRC4
echo -e "${jeshile} [+] /etc/mysql/my.cnf backuped as my.cnf_backup_by_TRC4 \e[0m"
echo -e "${jeshile} [+] ORIGINAL FILE /var/www/html/crack/mysqlcnf/original \e[0m"
sed -i 's/max_connections = 5000/max_connections = 20000/g' /etc/mysql/my.cnf
echo -e "${jeshile} [+] MYSQL Connections Has Been Now Modified Minimum 5000 to Maximum 20000 \e[0m"
service mysql restart
echo " "
echo -e "${jeshile} ┌───────────────────────┐ \e[0m"
echo -e "${jeshile} │  Removing TEMP Files  │ \e[0m"
echo -e "${jeshile} └───────────────────────┘ \e[0m"
echo " "
rm /root/install_iptv_pro.php
rm /root/xtreamcodes_1.0.60_Nulled.sh
echo " "

sleep 8
reboot
echo " "
echo -e "${jeshile} ┌───────────────────────┐ \e[0m"
echo -e "${jeshile} │[R]  Rebooting VPS...  │ \e[0m"
echo -e "${jeshile} └───────────────────────┘ \e[0m"
echo " "
