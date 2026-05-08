#/bin/bash -x

##Check if a deployment is curentlly running
GIT_COMMIT=$1
MODE=$2
BASE_DIR=$3
DEPOLY=$4
#DEPOLY=payplus-kafka-deployment
OPS_DIR=$BASE_DIR/ops/k8s/deployment
DOCKER_REPO_NAME=713117837264.dkr.ecr.eu-west-2.amazonaws.com/paypluskafka

if [ "$MODE" = "production" ]
then
	TEMPLATE=$DEPOLY.yaml.production.tmpl
	ns=pp-prod
	echo "deploy to production, $ns"
elif [ "$MODE" = "dev" ]
then 
	TEMPLATE=$DEPOLY.yaml.dev.tmpl
	ns=dev
	echo "deploy to dev, $ns"
elif [ "$MODE" = "beta" ]
then 
	DOCKER_REPO_NAME=713117837264.dkr.ecr.eu-west-2.amazonaws.com/paypluskafka-beta
	TEMPLATE=$DEPOLY.yaml.beta.tmpl
	ns=beta
	echo "deploy to beta, $ns"
else
	echo "k8s namespace is not clear.. exiting"
	exit 1
fi

kubectl describe deploy -n $ns| grep "^Name: * $DEPOLY"
if [ "$?" -eq 0 ]
   then
  	 echo "$DEPOLY is running, need to update deployment"
	 kubectl -n $ns set image deployment/$DEPOLY $DEPOLY=$DOCKER_REPO_NAME:$GIT_COMMIT --record=true
   else 
	 echo "$DEPOLY is NOT running will deploy a new deployment"
	 cat $OPS_DIR/$TEMPLATE | sed -e "s,imagename,$DOCKER_REPO_NAME:$GIT_COMMIT," > $OPS_DIR/$DEPOLY.yaml
	 kubectl -n $ns apply -f $OPS_DIR/$DEPOLY.yaml --record=true
	 rm -f $OPS_DIR/$DEPOLY.yaml
fi   
