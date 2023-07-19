#!/bin/sh

mode=$1

if [ "$mode" != "local" ]; then
    export $(cat usr/share/nginx/project/secret.env | xargs)
fi


