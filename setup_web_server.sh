#!/bin/sh
source ./env.sh

SSH_RUN="ssh ec2-user@$1 -i $KEY_NAME.pem -o StrictHostKeyChecking=no"

echo "Installing Apache"
$SSH_RUN "sudo yum install -y httpd"

echo "Starting Apache"
$SSH_RUN "sudo service httpd start"

echo "Setting up web page"
$SSH_RUN "echo \"<html><body><h1>Hello cloud gurus</h1></body></html>\" | sudo tee /var/www/html/index.html"
