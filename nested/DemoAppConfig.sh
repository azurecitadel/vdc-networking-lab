#!/bin/bash

echo "-----------------------"
date +"%b %d %H:%M:%S"
echo "Running setup script - also runs apt-get update"
curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash -
echo "-----------------------"

echo "Installing and updating"
sudo apt-get update --quiet && \
  sudo apt-get install --assume-yes -qq nodejs git lynx moreutils && \
  sudo apt-get dist-upgrade --assume-yes --quiet

#### date +"%b %d %H:%M:%S"
#### echo "Installing aptitude"
#### sudo apt-get install --assume-yes -qq aptitude
#### 
#### date +"%b %d %H:%M:%S"
#### echo "Patching OS using aptitude"
#### sudo aptitude update --assume-yes --quiet
#### sudo aptitude install nodejs git lynx moreutils --assume-yes --quiet
#### sudo aptitude full-upgrade --assume-yes --quiet
#### sudo aptitude autoclean --assume-yes --quiet

date +"%b %d %H:%M:%S"
echo "Cloning the demo app"
git clone https://github.com/araffe/nodejs-demoapp.git ~labuser/nodejs-demoapp
sudo chmod 755 ~labuser/nodejs-demoapp
sudo chown labuser:labuser ~labuser/nodejs-demoapp

date +"%b %d %H:%M:%S"
echo "Configure nodejs and its packages"
cd ~labuser/nodejs-demoapp/
sudo /usr/bin/npm i npm@latest -g
/usr/bin/npm install
sudo npm audit fix
sudo chown -R labuser:labuser ~labuser/nodejs-demoapp

date +"%b %d %H:%M:%S"
echo "Configure systemd and start node"

sudo curl -sL --output /etc/systemd/system/demoapp.service https://raw.githubusercontent.com/azurecitadel/vdc-networking-lab/master/nested/demoapp.service

sudo systemctl daemon-reload
systemctl cat demoapp
sudo systemctl enable demoapp
sudo systemctl start demoapp

sleep 10
/usr/bin/curl http://localhost:3000

date +"%b %d %H:%M:%S"
echo "Updating the labuser .bashrc for coloured prompts"
[[ ! -f ~labuser/.bashrc.orig ]] && cp -p ~labuser/.bashrc ~labuser/.bashrc.orig
curl --silent https://raw.githubusercontent.com/azurecitadel/vdc-networking-lab/master/nested/.bashrc > ~labuser/.bashrc

if [ -f /var/run/reboot-required -a "$(whoami)" = "root" ]
then
    date +"%b %d %H:%M:%S"
    echo "System restart required - submitting at job"
    at now + 1 min <<-EOF
	shutdown --reboot --no-wall now
	EOF
fi

exit 0