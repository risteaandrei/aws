#!/bin/sh
source env.sh

aws ec2 run-instances \
 --image-id $AMI_ID \
 --count 1 \
 --instance-type t2.micro \
 --key-name $KEY_NAME \
