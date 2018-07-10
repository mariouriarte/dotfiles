#!/bin/sh
##sudo pacman -Syu
#
##apache
#sudo pacman -S vim neovim apache
##sudo vim /etc/httpd/conf/httpd.conf
#sudo systemctl enable httpd
#sudo systemctl restart httpd
#
##mysql
#sudo pacman -S mysql
#sudo mysql_install_db --user=mysql --basedir=/usr --datadir=/var/lib/mysql
#sudo systemctl enable mysqld
#sudo systemctl start mysqld
#sudo mysql_secure_installation
#
##php
#sudo pacman -S php php-apache
#
#echo 'Find the following line and comment it out:'
#echo '#LoadModule mpm_event_module modules/mod_mpm_event.so'
#echo 'Uncomment or add the line:'
#echo 'LoadModule mpm_prefork_module modules/mod_mpm_prefork.so'
#sudo vim /etc/httpd/conf/httpd.conf
#
#sudo echo 'LoadModule php7_module modules/libphp7.so' >> /etc/httpd/conf/httpd.conf
#sudo echo 'AddHandler php7-script php' >> /etc/httpd/conf/httpd.conf
#sudo echo 'Include conf/extra/php7_module.conf' >> /etc/httpd/conf/httpd.conf
#
#sudo systemctl restart httpd
#
## phpmyadmin
#sudo pacman -S phpmyadmin php-mcrypt
#
##Make sure the following lines are uncommented.
##extension=bz2.so
##extension=mcrypt.so
##extension=mysqli.so
#
#sudo vim /etc/php/php.ini

#create phpmyadmin config file
#sudo touch /etc/httpd/conf/extra/phpmyadmin.conf
#echo 'Alias /phpmyadmin "/usr/share/webapps/phpMyAdmin"' | sudo tee --append /etc/httpd/conf/extra/phpmyadmin.conf > /dev/null
#echo '<Directory "/usr/share/webapps/phpMyAdmin">' | sudo tee --append /etc/httpd/conf/extra/phpmyadmin.conf > /dev/null
#echo 'DirectoryIndex index.php' | sudo tee --append /etc/httpd/conf/extra/phpmyadmin.conf > /dev/null
#echo 'AllowOverride All' | sudo tee --append /etc/httpd/conf/extra/phpmyadmin.conf > /dev/null
#echo 'Options FollowSymlinks' | sudo tee --append /etc/httpd/conf/extra/phpmyadmin.conf > /dev/null
#echo 'Require all granted' | sudo tee --append /etc/httpd/conf/extra/phpmyadmin.conf > /dev/null
#echo '</Directory>' | sudo tee --append /etc/httpd/conf/extra/phpmyadmin.conf > /dev/null

#echo 'Include conf/extra/phpmyadmin.conf' | sudo tee --append /etc/httpd/conf/httpd.conf > /dev/null

## postgresql
#sudo pacman -S php-pgsql
#sudo pacman -S php-iconv
#sudo pacman -S postgresql
#sudo -u postgres -i
##iniciar la postgresql: initdb --locale $LANG -E UTF8 -D '/var/lib/postgres/data'
#
#sudo systemctl enable postgresql.service
#sudo systemctl start postgresql.service
## dont forget
## sudo vim /etc/pacman.conf
## add:
## IgnorePkg = postgresql postgresql-libs

##phppgadmin
#sudo pacman -S phppgadmin
#sudo touch /etc/httpd/conf/extra/phppgadmin.conf
echo 'Alias /phppgadmin "/usr/share/webapps/phppgadmin"' | sudo tee --append /etc/httpd/conf/extra/phppgadmin.conf > /dev/null
echo '<Directory "/usr/share/webapps/phppgadmin">' | sudo tee --append /etc/httpd/conf/extra/phppgadmin.conf > /dev/null
echo '    DirectoryIndex index.php' | sudo tee --append /etc/httpd/conf/extra/phppgadmin.conf > /dev/null
echo '    AllowOverride All' | sudo tee --append /etc/httpd/conf/extra/phppgadmin.conf > /dev/null
echo '    Options FollowSymlinks' | sudo tee --append /etc/httpd/conf/extra/phppgadmin.conf > /dev/null
echo '    Require all granted' | sudo tee --append /etc/httpd/conf/extra/phppgadmin.conf > /dev/null
echo '</Directory>' | sudo tee --append /etc/httpd/conf/extra/phppgadmin.conf > /dev/null
#
#echo '# phpPgAdmin configuration'  | sudo tee --append /etc/httpd/conf/httpd.conf > /dev/null
#echo 'Include conf/extra/phppgadmin.conf'  | sudo tee --append /etc/httpd/conf/httpd.conf > /dev/null
#sudo systemctl restart httpd.service

#sudo pacman -S xorg-xauth
#sudo pacman -S iconv
#
#sudo pacman -S wget
#sudo pacman -S samba
#sudo pacman -S samba nautilus-share gvfs-smb
