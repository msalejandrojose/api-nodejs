#!/bin/sh

mode=$1

if [ "$mode" != "local" ]; then
    echo "Import secrets"
    ls ../usr/share/nginx/project/secret.env
    cat ../usr/share/nginx/project/secret.env
    export $(cat ../usr/share/nginx/project/secret.env | xargs)
fi