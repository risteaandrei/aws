#!/bin/sh
source env.sh

ssh ec2-user@$1 -i $KEY_NAME.pem -o StrictHostKeyChecking=no "echo 2>&1"
echo $?
