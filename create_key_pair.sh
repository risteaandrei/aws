#!/bin/sh
source env.sh
aws ec2 create-key-pair \
 --key-name $KEY_NAME \
 --query 'KeyMaterial' \
 --output text \
 > $KEY_NAME.pem