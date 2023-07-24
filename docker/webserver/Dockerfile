FROM alpine:latest

ARG project_id
ARG env

# Instalar paquetes y dependencias de Nginx y Node.js
RUN apk add --no-cache openssl nginx nodejs npm

# Copiar los archivos de configuración
COPY ./ /usr/share/nginx/project

COPY ./docker/webserver/nginx/nginx.conf /etc/nginx/

COPY ./docker/webserver/nginx/api.conf /etc/nginx/api.conf
COPY ./docker/webserver/nginx/conf.d/server-template.conf /etc/nginx/conf.d/env.conf
COPY ./docker/webserver/scripts ./scripts
RUN chmod +x /scripts -R
RUN dos2unix /scripts/*

# Exponer el puerto 80 y 443
EXPOSE 80 443

WORKDIR /usr/share/nginx/project/api
RUN npm i
WORKDIR /

# Comando para iniciar el servidor NGINX y NODE JS
#ENTRYPOINT ["sh", "-c", "scripts/entrypoint.sh $env && node usr/share/nginx/project/api/index.js"]
CMD ["sh", "-c", "scripts/entrypoint.sh $env & node usr/share/nginx/project/api/index.js"]
