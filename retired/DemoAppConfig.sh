#!/bin/bash - now in LF

echo "Patching OS"
sudo apt-get update --quiet
sudo apt-get dist-upgrade --quiet --yes
sudo apt-get autoremove -qq 

echo "Installing aptitude"
sudo apt-get install --yes aptitude

echo "Running setup script"
curl -sL https://deb.nodesource.com/setup_9.x | sudo -E bash --

# Install node.js
echo "Installing nodejs - now includes npm"
sudo aptitude install nodejs --quiet --assume-yes

# Clone Git repo for demo app
echo "Installing git and cloning the app"
sudo aptitude install git --quiet --assume-yes

echo "Cloning the app"
git clone https://github.com/araffe/nodejs-demoapp.git
cd nodejs-demoapp/

echo "Installing forever"
sudo npm install forever -g &>/dev/null
sudo npm install &>/dev/null
forever --version

echo "Run the app"
forever start ./bin/www