#!/bin/sh 

name=$1

docker-machine create -d g5k \
--g5k-username "mbelgaid" \
--g5k-password '001010CH@k!b++' \
--g5k-site "nancy" \
--g5k-walltime "12:00:00" \
test$name


docker-machine scp launcher.sh "test$name:"
 da=testes$name-$(date "+%Y-%m-%d")

mkdir $da
cp "testes.ipynb" $da
cp "launcher.sh" $da 
docker-machine ssh test$name "./launcher.sh" $name

cd $da 
docker-machine scp test$name:*power .
sleep 2 
docker-machine rm -f test$name