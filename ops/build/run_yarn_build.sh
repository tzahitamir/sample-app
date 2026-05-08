#!/bin/bash

KAFKA_ENV=$1
source $KAFKA_ENV
echo $KAFKA_BROKER


yarn build

if [ "$?" -eq 0 ]
	then
		echo "yarn build completed succesfully"
	else
		exit 1;
fi

