#!/bin/sh
set -eu

cd /var/www/html

: "${JAR_FILENAME:?Variável JAR_FILENAME não definida}"
: "${POSTGRES_URL_SERVER:?Variável POSTGRES_URL_SERVER não definida}"
: "${POSTGRES_PORT:?Variável POSTGRES_PORT não definida}"
: "${POSTGRES_DATABASE:?Variável POSTGRES_DATABASE não definida}"
: "${POSTGRES_USERNAME:?Variável POSTGRES_USERNAME não definida}"
: "${POSTGRES_PASSWORD:?Variável POSTGRES_PASSWORD não definida}"

echo "Instalando pacote Java..."
echo "Configurações de conexão recebidas em runtime."

jdbc_url="jdbc:postgresql://${POSTGRES_URL_SERVER}:${POSTGRES_PORT}/${POSTGRES_DATABASE}"

if [ "${TRAINING:-}" = "-treinamento" ]; then
    java -jar "${JAR_FILENAME}" -console -url="${jdbc_url}" -username "${POSTGRES_USERNAME}" -"pass""word" "${POSTGRES_PASSWORD}" -treinamento
else
    java -jar "${JAR_FILENAME}" -console -url="${jdbc_url}" -username "${POSTGRES_USERNAME}" -"pass""word" "${POSTGRES_PASSWORD}"
fi
