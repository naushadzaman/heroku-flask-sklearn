#!/bin/sh

sudo apt-get install python-pip
sudo apt-get install git

# Install Heroku toolbelt
# https://toolbelt.heroku.com/debian
wget -qO- https://toolbelt.heroku.com/install-ubuntu.sh | sh

sudo pip install virtualenv
sudo apt-get update


virtualenv venv --distribute --no-site-packages
source venv/bin/activate


heroku keys:add

## Temporary enable swap on the micro instance, enable 1GB swap
sudo /bin/dd if=/dev/zero of=/var/swap.1 bs=1M count=1024
sudo /sbin/mkswap /var/swap.1
sudo /sbin/swapon /var/swap.1


# Install pre-requisites, numpy, scipy, sklearn
sudo apt-get install -y libatlas-base-dev gfortran python-dev build-essential g++
pip install numpy
pip install scipy
pip install scikit-learn


## Disable swap
sudo swapoff /var/swap.1
sudo rm /var/swap.1


# Install Flask, the web framework, and Gunicorn, the web server.
pip install Flask gunicorn

## Installation on AWS 
## https://gist.github.com/dacamo76/4780765