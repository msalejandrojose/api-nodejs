FROM alpine:latest

ARG mode
ARG project_id

# Instalar paquetes y dependencias de Nginx y Node.js
RUN apk add --no-cache openssl nginx nodejs npm

# Copiar los archivos de configuración
COPY ./api /usr/share/nginx/project/api
COPY ./docker/proxy-server/nginx/nginx.conf /etc/nginx/
#COPY ./nginx/location-front.conf /etc/nginx/location-front.conf
#COPY ./nginx/location-bo.conf /etc/nginx/location-bo.conf
COPY ./docker/proxy-server/nginx/location-api.conf /etc/nginx/location-api.conf
COPY ./docker/proxy-server/nginx/conf.d/server.conf /etc/nginx/conf.d/env.conf
COPY ./docker/proxy-server/scripts ./scripts
COPY ./docker/proxy-server/certs ./certs
RUN chmod +x /scripts -R
RUN dos2unix /scripts/*
RUN /scripts/certs.sh "${mode}" "${project_id}"

# Exponer el puerto 80 y 443
EXPOSE 80 443

WORKDIR /usr/share/nginx/project/api
RUN npm i

# Comando para iniciar el servidor NGINX y NODE JS
CMD ["sh", "-c", "nginx -g 'daemon off;' & node index.js"]