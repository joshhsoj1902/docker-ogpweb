#!/bin/bash

if [ ! -f /var/www/html/install.php ]; then
    echo "File not found!"
    exit 1
else
    echo "File Found"
    exit 0
fi