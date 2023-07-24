#!/bin/sh

#Set VARIABLES
export HCP_CLIENT_ID=$1
export HCP_CLIENT_SECRET=$2
export VLT_ORGANIZATION_ID=dca79ada-fa97-451a-9c05-e92f2d5ce848
export VLT_PROJECT_ID=c995e8be-defc-402a-abc6-58dffaa25c20
export VLT_APPLICATION_NAME=test-application

#LOGIN IN VLT
vlt login
vlt config
vlt secrets

# Archivo de salida
archivo_salida="secret.txt"

# Obtener la lista de variables omitiendo la primera línea
variables=$(vlt secrets | tail -n +2)

# Iterar sobre cada variable
echo "$variables" | while IFS= read -r linea; do
  # Obtener el nombre de la variable
  nombre=$(echo "$linea" | awk '{print $1}')

  # Obtener el valor del secreto
  valor=$(vlt secrets get -plaintext "$nombre")

  # Guardar la variable y su valor en el archivo de salida
  echo "${nombre}=${valor}" >> "$archivo_salida" 2>/dev/null
done