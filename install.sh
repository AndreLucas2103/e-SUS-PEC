cd /var/www/html

echo "Instalando pacote java ${JAR_FILENAME}"
echo "Verificando variável de treinamento ${TRAINING}"

echo "java -jar ${JAR_FILENAME} -console -url="jdbc:postgresql://${POSTGRES_URL_SERVER}:${POSTGRES_PORT}/${POSTGRES_DATABASE}" -username ${POSTGRES_USERNAME} -password ${POSTGRES_PASSWORD} ${TRAINING}"
java -jar ${JAR_FILENAME} -console -url="jdbc:postgresql://${POSTGRES_URL_SERVER}:${POSTGRES_PORT}/${POSTGRES_DATABASE}" -username ${POSTGRES_USERNAME} -password ${POSTGRES_PASSWORD} ${TRAINING}