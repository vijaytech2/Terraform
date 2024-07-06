#!/bin/bash
sudo yum update -y
sudo yum install -y httpd
sudo systemctl start httpd
sudo systemctl enable httpd
sudo su -
cd /var/www/html
echo "Hello Vijay !!, I am just coming from $(hostname -f)" > index.html
echo $(curl http://169.254.169.254/latest/meta-data/local-ipv4) >> index.html
EC2_AVAIL_ZONE=$(curl -s http://169.254.169.254/latest/meta-data/placement/availability-zone)