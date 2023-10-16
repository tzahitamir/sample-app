#!/bin/bash -x

aws ecr get-login-password --region eu-west-2 | docker login --username AWS --password-stdin 713117837264.dkr.ecr.eu-west-2.amazonaws.com && docker build -t sample-app . && docker tag sample-app:latest 713117837264.dkr.ecr.eu-west-2.amazonaws.com/sample-app:latest && docker push 713117837264.dkr.ecr.eu-west-2.amazonaws.com/sample-app:latest

