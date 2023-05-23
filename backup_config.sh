#!/bin/bash

# go to ~/3dprinting-e3v2/klipper/configs
cd ~/3dprinting-e3v2/klipper/configs

# git pull for changes
git pull

# Create a directory of the current year, month and day in the following format YY.MM.DD
today=$(date +'%y.%m.%d')
mkdir $today

# Go to ~/printer_data/config
cd ~/printer_data/config

# Copy the contents of the /config folder to the folder you created in section 2.
cp *.* ~/3dprinting-e3v2/klipper/configs/${today}/

# Edit the moonchord.json file and remove the "bot_token" value and save the changes.
sed -i 's/\("bot_token":\).*/\1 "",/'  ~/3dprinting-e3v2/klipper/configs/${today}/mooncord.json

# Do git add .
cd ~/3dprinting-e3v2/klipper/
git add .

# Do git commit -m "auto backup"
git commit -m "auto backup"

# Do git push
git push
