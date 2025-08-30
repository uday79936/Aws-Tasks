#!/bin/bash
sudo apt -y update
sudo apt -y install nginx
sudo systemctl start nginx
sudo systemctl enable nginx
sudo rm -rf /var/www/html*
sudo git clone https://github.com/Ai-TechNov/mario.git /var/www/html/
