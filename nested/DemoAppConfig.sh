#!/bin/bash - now in LF

date +"%b %d %H:%M:%S"
echo "Patching OS"
sudo apt-get update --quiet
sudo apt-get dist-upgrade --quiet --yes
sudo apt-get autoremove -qq 

date +"%b %d %H:%M:%S"
echo "Installing aptitude, lynx and moreutils"
sudo apt-get install --yes aptitude lynx moreutils

date +"%b %d %H:%M:%S"
echo "Running setup script"
curl -sL https://deb.nodesource.com/setup_9.x | sudo -E bash --

date +"%b %d %H:%M:%S"
# Install node.js
date +"%b %d %H:%M:%S"
echo "Installing nodejs - now includes npm"
sudo aptitude install nodejs --quiet --assume-yes

# Clone Git repo for demo app
date +"%b %d %H:%M:%S"
echo "Installing git and cloning the app"
sudo aptitude install git --quiet --assume-yes

date +"%b %d %H:%M:%S"
echo "Cloning the app"
git clone https://github.com/araffe/nodejs-demoapp.git
cd nodejs-demoapp/

date +"%b %d %H:%M:%S"
echo "Installing forever"
sudo npm install forever -g &>/dev/null
sudo npm install &>/dev/null
forever --version

date +"%b %d %H:%M:%S"
echo "Run the app"
forever start ./bin/www