#!/bin/bash

MODE=$1
DATAFILE=$WORKSPACE/ops/k8s/configmap/env.$1
TEMPLATE=$WORKSPACE/ops/k8s/configmap/kafka-cm.tmpl
BASE=kafka-cm

if [ "$MODE" = "production" ]
then
	NS=pp-prod
	CM_FILE=$BASE-$NS
	echo will now update cm of $1 in $NS namespace
	rm -f $CM_FILE.yaml
	cp $TEMPLATE $CM_FILE.yaml
	cat $DATAFILE | grep -v "#" >> $CM_FILE.yaml
	kubectl apply -f $CM_FILE.yaml -n $NS 
		if [ "$?" -eq 0 ]
		then
		 echo ""	 
		 echo "Successfully updated ConfigMap in $NS namespace"
		 echo ""	 
		 else
		 echo ""	 
		 echo "update of ConfigMap faild, in $NS namespace Exit script"
		 echo ""	 
		 exit 1
		fi		
elif [ "$MODE" = "dev" ]
then
	NS=dev
	CM_FILE=$BASE-$NS
	echo will now update cm of $1 in $NS namespace
	rm -f $CM_FILE.yaml
	cp $TEMPLATE $CM_FILE.yaml
	cat $DATAFILE | grep -v "#" >> $CM_FILE.yaml
	kubectl apply -f $CM_FILE.yaml -n $NS 
		if [ "$?" -eq 0 ]
		then
		 echo ""	 
		 echo "Successfully updated ConfigMap in $NS namespace"
		 echo ""	 
		 else
		 echo ""	 
		 echo "update of ConfigMap faild, in $NS namespace Exit script"
		 echo ""	 
		 exit 1
		fi		
elif [ "$MODE" = "beta" ]
then
	NS=beta
	CM_FILE=$BASE-$NS
	echo will now update cm of $1 in $NS namespace
	rm -f $CM_FILE.yaml
	cp $TEMPLATE $CM_FILE.yaml
	cat $DATAFILE | grep -v "#" >> $CM_FILE.yaml
	kubectl apply -f $CM_FILE.yaml -n $NS 
		if [ "$?" -eq 0 ]
		then
		 echo ""	 
		 echo "Successfully updated ConfigMap in $NS namespace"
		 echo ""	 
		 else
		 echo ""	 
		 echo "update of ConfigMap faild, in $NS namespace Exit script"
		 echo ""	 
		 exit 1
		fi		
else
	echo "Namespace is not clear.. exiting"
	exit 1	
fi
