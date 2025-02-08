#!/bin/ba
IMAGE=ubuntu-fuzix
DIR=$(dirname $0)
BRANCH=work
cd $DIR
pwd
if [ -z $(which winpty) ]; then WINPTY=; else WINPTY=winpty; fi
CONTAINER=$IMAGE.$BRANCH
ID=$(docker ps -q -l -a -f name=^$CONTAINER\$)
echo Container name: [$CONTAINER] -- Container id: [$ID]
if [[ -n $ID ]];
then
  $WINPTY docker start -a -i $ID
else
  $WINPTY docker run -it --cpus 4 --memory 4g --name $CONTAINER \
  -v "$DIR/mount:/mount" \
  $IMAGE:latest bash
fi
read -p "Press ENTER:"
