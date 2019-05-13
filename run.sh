#!/bin/sh
echo "Creating instance"
INSTANCE_JSON=$(./create_instance.sh)

INSTANCE_ID=$(python extract_instance_id.py "$INSTANCE_JSON")
echo "Created instance $INSTANCE_ID"

INSTANCE_DNS_NAME=$(./retrieve_dns_name.sh $INSTANCE_ID)

echo "Waiting for ssh to become available"
while true; do
	IS_AVAILABLE=$(./check_ssh_connection.sh $INSTANCE_DNS_NAME)
	if [ $IS_AVAILABLE -eq 0 ]; then
		break
	fi
	sleep 5
done

echo "Setting up web server"
./setup_web_server.sh $INSTANCE_DNS_NAME

echo "Querying the web server"
curl $INSTANCE_DNS_NAME
#<html><body><h1>Hello cloud gurus</h1></body></html>

echo "Terminating instance"
./terminate_instance.sh $INSTANCE_ID
