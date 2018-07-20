#!/bin/bash - now in LF

date +"%b %d %H:%M:%S"
echo "Installing aptitude"
sudo apt-get install --assume-yes -qq aptitude

date +"%b %d %H:%M:%S"
echo "Patching OS"
sudo aptitude update --assume-yes --quiet
sudo aptitude install nodejs git upstart monit lynx moreutils --assume-yes --quiet
sudo aptitude full-upgrade --assume-yes --quiet
sudo aptitude autoclean --assume-yes --quiet

echo "-----------------------"
date +"%b %d %H:%M:%S"
echo "Running setup script"
curl -sL https://deb.nodesource.com/setup_9.x | sudo -E bash --
echo "-----------------------"

date +"%b %d %H:%M:%S"
echo "Cloning the demo app"
git clone https://github.com/araffe/nodejs-demoapp.git ~labuser/nodejs-demoapp
sudo chmod 755 ~labuser/nodejs-demoapp
sudo chown labuser:labuser ~labuser/nodejs-demoapp

date +"%b %d %H:%M:%S"
echo "Configure the nodejs packages"
cd ~labuser/nodejs-demoapp/
/usr/bin/npm install --silent 


date +"%b %d %H:%M:%S"
echo "Configure systemd and start node"

sudo curl -sL --output /etc/systemd/system/demoapp.service https://raw.githubusercontent.com/azurecitadel/vdc-networking-lab/master/nested/demoapp.service

sudo systemctl daemon-reload
systemctl cat demoapp
sudo systemctl enable demoapp
sudo systemctl start demoapp

/usr/bin/curl http://localhost:3000

date +"%b %d %H:%M:%S"
echo "Updating the labuser .bashrc for coloured prompts"
[[ ! -f ~labuser/.bashrc.orig ]] && cp -p ~labuser/.bashrc ~labuser/.bashrc.orig
curl --silent https://raw.githubusercontent.com/azurecitadel/vdc-networking-lab/master/nested/.bashrc > ~labuser/.bashrc