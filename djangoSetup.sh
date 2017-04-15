#!/bin/bash
## Target OS: Ubuntu Server (LTS)
echo "Setting up Django in virtualenv..."

echo "Installing dependencies..."
apt-get install python3 python3-pip
pip3 install --upgrade pip
pip3 install virtualenv

echo "Attempting to set up virtualenv..."
cd /opt
virtualenv --python=python3 project
echo "Entering virtualenv..."
source /opt/project/bin/activate
echo "Installing Django in virtualenv with pip..."
pip3 install django
