#!/bin/sh
IMAGE=ubuntu-fuzix
DIR=$(dirname $0)
 if [ -z $(which winpty) ]; then WINPTY=; else WINPTY=winpty; fi
cd $DIR
$WINPTY docker build -t $IMAGE --file Dockerfile -m 4g .
read -p "Press ENTER:"
