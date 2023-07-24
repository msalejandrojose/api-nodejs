#!/bin/sh

#Import secrets into Phase ENTRYPOINT
echo "Import secrets"
export $(cat ../usr/share/nginx/project/.env | xargs)

#CHANGE VARIABLES INTO CONFIG NGINX
sed -i "s/{ROOT_API_URL}/$ROOT_API_URL/g" /etc/nginx/conf.d/env.conf
#sed -i "s/{ROOT_API_URL}/_/g" /etc/nginx/conf.d/env.conf

nginx -g 'daemon off;'

