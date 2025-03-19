#!/bin/bash

echo "Updating package list..."
sudo apt update -y

echo "Installing Python and virtual environment tools..."
sudo apt install -y python3 python3-pip python3-venv

echo "Creating a virtual environment..."
python3 -m venv venv

echo "Activating the virtual environment..."
source venv/bin/activate

echo "Installing dependencies from requirements.txt..."
pip install --upgrade pip
pip install -r requirements.txt

echo "Building the application..."
# Add your application build steps here

echo "Deactivating virtual environment..."
deactivate

echo "Build process completed successfully."
