#!/bin/bash

docker rm -f $(docker ps -q)
docker rmi $(docker images -q)
docker volume rm if $(docker volume ls -q)
