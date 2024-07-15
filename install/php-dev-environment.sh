# php
sudo add-apt-repository ppa:ondrej/php -y
sudo apt install -y openssl php php-bcmath php-curl php-gd php-json php-mbstring php-memcached php-mysql php-sqlite3 php-tokenizer php-xml php-zip

# old phps
sudo apt install -y php7.4 php7.4-cli
sudo apt install -y php8.0 php8.0-cli
sudo apt install -y php8.1 php8.1-cli
sudo apt install -y php8.2 php8.2-cli

# composer
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
php -r "if (hash_file('sha384', 'composer-setup.php') === 'dac665fdc30fdd8ec78b38b9800061b4150413ff2e3b6f88543c636f7cd84f6db9189d43a81e5503cda447da73c7e5b6') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
php composer-setup.php
php -r "unlink('composer-setup.php');"
sudo mv composer.phar /usr/local/bin/composer

# node and npm
sudo apt install -y nodejs npm
