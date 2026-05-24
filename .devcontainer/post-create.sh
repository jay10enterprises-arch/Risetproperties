#!/bin/bash

# Fix terminal and service policy warnings safely
export DEBIAN_FRONTEND=noninteractive
sudo sh -c "echo '#!/bin/sh\nexit 0' > /usr/sbin/policy-rc.d"

# Update and install MariaDB components
sudo apt-get update
sudo apt-get install -y mariadb-server mariadb-client

# Start MariaDB service
sudo systemctl start mariadb

# Create the database securely
sudo mariadb -u root -e "CREATE DATABASE IF NOT EXISTS riset_properties DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;"

# Remove the temporary policy bypass
sudo rm -f /usr/sbin/policy-rc.d
