#!/bin/bash

# Path sumber dan tujuan
SOURCE="/home/sourcecode/"
STORAGE="/home/sourcecode/storage"
DESTINATION="/var/www/html/dashboard-gateway"

# Cek apakah folder storage sudah ada di tujuan
if [ ! -d "$DESTINATION/storage" ]; then
    echo "Folder storage tidak ditemukan di $DESTINATION, menyalin folder..."
    rsync -av --delete "$SOURCE/" "$DESTINATION"
else
    rsync -av --delete --exclude=/storage "$SOURCE/" "$DESTINATION"
fi
