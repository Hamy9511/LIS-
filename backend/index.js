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
  console.log(`Servidor de backend inicializado en el puerto ${port}`);
});
