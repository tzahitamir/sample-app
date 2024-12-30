#!/bin/bash


CXXFLAGS="--std=c++17" yarn install
yarn add git+ssh://git@bitbucket.org:payplusv2/pay-plus-core.git

if [ "$?" -eq 0 ]
	then
		echo "yarn install completed succesfully"
	else
		exit 1;
fi
