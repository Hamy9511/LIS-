#!/bin/sh

# Si no existe el archivo angular.json, asumimos que el proyecto no ha sido inicializado
if [ ! -f "angular.json" ]; then
    echo "¡No se detectó un proyecto Angular! Creando un nuevo proyecto por defecto..."
    
    # Angular CLI requiere que el directorio esté vacío (o casi vacío) para ng new.
    # Dado que estamos mapeando un volumen que puede estar recién creado, ng new funcionará perfecto.
    ng new angular-frontend --directory . --defaults --skip-git --style=scss
    
    echo "Proyecto Angular creado exitosamente."
fi

# Asegurarse de que las dependencias estén instaladas (útil si ya existe el proyecto o se reconstruye)
npm install

echo "Iniciando servidor de desarrollo de Angular..."
# Ejecutamos con --host 0.0.0.0 para que sea accesible desde fuera del contenedor
# --poll 2000 es crítico para que el hot-reload funcione en Windows usando Docker Desktop
ng serve --host 0.0.0.0 --poll 2000
