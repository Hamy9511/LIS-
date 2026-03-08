FROM node:20-alpine

WORKDIR /app

# Instalar nodemon para hot-reloading en desarrollo
RUN npm install -g nodemon

# Copiar el script de inicio
COPY entrypoint.sh /usr/local/bin/

# Asegurarse de que los saltos de línea sean LF
RUN set -ex && dos2unix /usr/local/bin/entrypoint.sh && chmod +x /usr/local/bin/entrypoint.sh

ENTRYPOINT ["entrypoint.sh"]
