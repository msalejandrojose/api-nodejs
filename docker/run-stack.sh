#!/bin/bash

export $(cat ../.env | grep '^PROJECT_ID=' | xargs)

docker stop $(docker ps -a -q)
docker rm $(docker ps -a -q)
docker compose --env-file ../.env -f ./docker-compose.yml down
docker compose --env-file ../.env -f ./docker-compose.yml build --build-arg env=local
docker compose --env-file ../.env -f ./docker-compose.yml up -d

docker ps -a
sleep 5s