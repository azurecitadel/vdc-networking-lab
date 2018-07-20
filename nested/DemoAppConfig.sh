#!/bin/bash - now in LF

date +"%b %d %H:%M:%S"
echo "Patching OS"
sudo apt-get update -qq
sudo apt-get dist-upgrade -qq
sudo apt-get autoremove -qq 

date +"%b %d %H:%M:%S"
echo "Installing aptitude, lynx and moreutils"
sudo apt-get install -qq aptitude lynx moreutils

date +"%b %d %H:%M:%S"
echo "Updating the labuser .bashrc for coloured prompts"
[[ ! -f ~labuser/.bashrc.orig ]] && cp -p ~labuser/.bashrc ~labuser/.bashrc.orig
curl --silent https://raw.githubusercontent.com/azurecitadel/vdc-networking-lab/master/nested/.bashrc > ~labuser/.bashrc

echo "-----------------------"
date +"%b %d %H:%M:%S"
echo "Running setup script"
curl -sL https://deb.nodesource.com/setup_9.x | sudo -E bash --
echo "-----------------------"

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
git clone https://github.com/araffe/nodejs-demoapp.git ~labuser/nodejs-demoapp
# git clone https://github.com/benc-uk/nodejs-demoapp.git ~labuser/nodejs-demoapp
cd ~labuser/nodejs-demoapp/

date +"%b %d %H:%M:%S"
echo "Installing forever"
sudo -H /usr/bin/npm install forever -g --silent 2>/dev/null
/usr/bin/npm install --silent 2>/dev/null
which /usr/bin/forever
/usr/bin/forever --version

date +"%b %d %H:%M:%S"
echo "Run the app"
/usr/bin/forever start ~labuser/nodejs-demoapp/bin/www 
# /usr/bin/forever start ~labuser/nodejs-demoapp/

/usr/bin/curl http://localhost:3000