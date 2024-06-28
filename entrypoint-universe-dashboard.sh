#!/bin/bash

# Path sumber dan tujuan
SOURCE="/home/sourcecode/"
STORAGE="/home/sourcecode/public/storage"
DESTINATION="/var/www/html/universe-dashboard"

# Cek apakah folder storage sudah ada di tujuan
if [ ! -d "$DESTINATION/public/storage" ]; then
    echo "Folder storage tidak ditemukan di $DESTINATION, menyalin folder..."
    rsync -av --delete "$SOURCE/" "$DESTINATION"
else
    echo "Folder storage sudah ada di $DESTINATION, menyalin kecuali /storage..."
    rsync -av --delete --exclude=/public/storage --exclude=/storage --exclude=.env "$SOURCE/" "$DESTINATION"
fi
