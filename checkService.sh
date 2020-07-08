#!/bin/bash

server=$1
port=$2

#get last status
laststatus=$(mysql -D servicestatus -sNe "select status from status where ip='$1' and port='$2' order by date desc limit 1")
echo "Last status code: "$laststatus
declare -i laststat
laststat=$laststatus

#NetCat gets server:port status 0 = OK 1 = Failed
nc -zv $server $port
x=$?
echo "Current status code: "$x

if [ $x = 0 ]
then
	echo "Service working fine"
	#write status 0 if previous status was 1
	if [ $laststat -eq 1 ]
	then
		mysql -D servicestatus -e "insert into status (ip, port, status) values ('$1','$2','$x');"
	fi
elif [ $x = 1 ]
then
	echo "Service seems to be down"
	mysql -D servicestatus -e "insert into status (ip, port, status) values ('$1','$2','$x');"
else
	echo "Whaaat the fuck???"
fi
