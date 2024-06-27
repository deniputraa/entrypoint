#!/bin/bash

# Path sumber dan tujuan
SOURCE="/home/sourcecode/storage"
DESTINATION="/var/www/html/dashboard-gateway"

# Cek apakah folder storage sudah ada di tujuan
if [ ! -d "$DESTINATION/storage" ]; then
    echo "Folder storage tidak ditemukan di $DESTINATION, menyalin folder..."
    rsync -av --delete /home/sourcecode/ /var/www/html/dashboard-gateway
else
    rsync -av --delete --exclude='/storage' /home/sourcecode/ /var/www/html/dashboard-gateway
fi
