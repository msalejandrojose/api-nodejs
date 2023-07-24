#!/bin/sh

env=$1

#Run Nest Js Start

cd ..
cd usr/share/nginx/project/api

echo $env
echo $1

if [ "$env" == "local" ]; then
    echo "lanzando nest js - local"
    npm run start:dev
else
    echo "lanzando nest js - remote"
    npm start
fi

