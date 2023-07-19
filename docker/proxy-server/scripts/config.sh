#!/bin/sh

export HCP_CLIENT_ID=$1
#"V2zh4kn7372DGDyqqKhK2DqEpyad8Ai6"
export HCP_CLIENT_SECRET=$2
export APP_NAME=test-application
#"Xtg-brkkEErIOJMsQbx__ZTQVHsXGKUzW4FH1TbD_V1XupzXPRSfV5wR_P2iuwGI"
echo "HOLAAA"
#
vlt login
vlt secrets get --app-name="test-application" ENV
vlt secrets

#vlt config ./vlt-config.yaml
#vlt config init test-application

# Archivo de salida
archivo_salida="secret.txt"

# Obtener la lista de variables omitiendo la primera línea
variables=$(vlt secrets | tail -n +2)

# Iterar sobre cada variable
while read -r linea; do
  # Obtener el nombre de la variable
  nombre=$(echo "$linea=" | awk '{print $1}')

  # Obtener el valor del secreto
  valor=$(vlt secrets get -plaintext "$nombre")

  # Guardar la variable y su valor en el archivo de salida
  echo "$nombre $valor" >> "$archivo_salida"
done <<< "$variables"