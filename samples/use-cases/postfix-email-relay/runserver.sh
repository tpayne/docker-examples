#!/bin/sh
docker build . -t emailserver:latest -f emailServer.docker --pull
docker network rm postfixserver
docker network create --subnet "172.10.0.0/16" --ip-range "172.10.1.0/24" postfixserver
docker run -it --rm --env-file envlist.txt --ip "172.10.1.5" -p 1000:587 --network postfixserver emailserver:latest
