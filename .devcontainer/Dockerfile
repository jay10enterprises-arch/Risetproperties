# [Choice] PHP version: 8.0
FROM mcr.microsoft.com/devcontainers/php:1-8.0-bullseye

# Install required packages
RUN apt-get update && apt-get install -y \
    apache2 \
    mariadb-server \
    mariadb-client \
    unzip \
    sudo \
    && rm -rf /var/lib/apt/lists/*

# Enable Apache modules
RUN a2enmod php8.0 rewrite headers expires

# Configure Apache document root
RUN sed -i 's|DocumentRoot /var/www/html|DocumentRoot /workspace|g' /etc/apache2/sites-available/000-default.conf

# Create MySQL runtime directory
RUN mkdir -p /var/run/mysqld && chmod 777 /var/run/mysqld

# Expose ports
EXPOSE 80 3306

# Set working directory
WORKDIR /workspace

# Start services
CMD ["/bin/bash", "-c", "service mysql start && apache2ctl -D FOREGROUND"]
