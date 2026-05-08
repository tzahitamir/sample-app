#!/bin/sh -x

MODE=$1 #this is the branch
BASE_DIR=$2 #this is $WORKSPACE
DOCKERFILE=$BASE_DIR/Dockerfile

if [ "$MODE" = "production" ]
then
	sed -i 's,#dist1,COPY dist.production /app/dist.production,' $DOCKERFILE
	sed -i 's,#dist2,COPY dist.dev /app/dist.dev,' $DOCKERFILE
else
	sed -i 's,#dist1,COPY dist.beta /app/dist.beta,' $DOCKERFILE
fi
