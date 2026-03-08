#!/bin/sh

# Si el package.json no existe, inicializamos el proyecto Node.js
if [ ! -f "package.json" ]; then
    echo "¡No se detectó un proyecto Node.js! Configurando proyecto básico..."
    
    # Inicializar npm con valores por defecto
    npm init -y
    
    # Instalar algunas dependencias elementales para el backend
    npm install express cors dotenv
    
    # Crear un archivo index.js inicial por defecto
    cat <<EOF > index.js
const express = require('express');
const cors = require('cors');

const app = express();
const port = process.env.PORT || 3000;

// Middlewares básicos
app.use(cors());
app.use(express.json());

// Ruta de ejemplo
app.get('/api/status', (req, res) => {
  res.json({ status: 'success', message: '¡Backend de Node.js funcionando correctamente!' });
});

app.listen(port, () => {
  console.log(\`Servidor de backend inicializado en el puerto \${port}\`);
});
EOF

    echo "Añadiendo script de inicio a package.json..."
    # Añadimos un script para iniciar con nodemon si es posible, aunque nodemon lo llamaremos directamente aquí
fi

# Instalar dependencias si faltan (por si clonaste un repo pero no hiciste npm install)
npm install

echo "Iniciando servidor backend (con nodemon para hot-reloading)..."
# Iniciaremos con nodemon para facilitar el desarrollo
nodemon index.js
