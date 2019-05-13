while true; do
	IS_AVAILABLE=$(./check_ssh_connection.sh $1)
	if [ $IS_AVAILABLE -eq 0 ]; then
		break
	fi
	sleep 5
done

#echo $(./check_ssh_connection.sh $1)
#echo test2