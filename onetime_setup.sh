#!/bin/sh

sudo apt-get install python-pip
sudo apt-get install git

# Install Heroku toolbelt
# https://toolbelt.heroku.com/debian
wget -qO- https://toolbelt.heroku.com/install-ubuntu.sh | sh

sudo pip install virtualenv
sudo apt-get update

heroku keys:add
