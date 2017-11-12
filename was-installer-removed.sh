#!/bin/bash

if [ ! -f /var/www/html/install.php ]; then
    echo "File not found, PASS!"
    exit 0
else
    echo "File Found, FAIL"
    exit 1
fi