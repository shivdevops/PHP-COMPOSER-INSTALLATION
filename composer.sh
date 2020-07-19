#!/bin/bash

#composer_installation

if [ ! -x /usr/local/bin/composer ]; then
echo
echo
	echo "INSTALLING composer"
echo
echo
	CURRENT=$(php -v | head -n 1 | cut -d " " -f 2 | cut -f1-2 -d".")

	echo "Y" | apt install curl php$CURRENT-cli php$CURRENT-mbstring git unzip
echo
echo
	cd ~
echo
echo
	curl -sS https://getcomposer.org/installer -o composer-setup.php
echo
echo
	HASH=$(curl https://composer.github.io/installer.sig | awk '{print $1}')
echo 
echo 
	php -r "if (hash_file('SHA384', 'composer-setup.php') === '$HASH') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
echo 
echo 
	php composer-setup.php --install-dir=/usr/local/bin --filename=composer
echo
echo
	rm -rf ~/composer-setup.php
	echo "SUCESSFULLY INSTALLED composer"
echo
echo

else
	echo "ALREAY INSTALLED composer"
echo
echo

fi

#composer_installation
