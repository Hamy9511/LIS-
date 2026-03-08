FROM node:20-alpine

WORKDIR /app

# Instalar Angular CLI globalmente
RUN npm install -g @angular/cli

# Copiar el script de inicio
COPY entrypoint.sh /usr/local/bin/

# Asegurarse de que los saltos de línea sean LF en lugar de CRLF (problema común en Windows)
RUN set -ex && dos2unix /usr/local/bin/entrypoint.sh && chmod +x /usr/local/bin/entrypoint.sh

ENTRYPOINT ["entrypoint.sh"]
