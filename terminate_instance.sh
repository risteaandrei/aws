#!/bin/sh
aws ec2 terminate-instances \
 --instance-ids $1
