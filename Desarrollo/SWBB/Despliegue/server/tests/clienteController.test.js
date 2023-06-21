const request = require('supertest');
const app = require('../index'); // Reemplaza '../app' con la ruta correcta a tu archivo principal de la aplicación (index.js, app.js, etc.)

describe('Cliente Controller', () => {
  // Test para el endpoint GET /clientes
  describe('GET /clientes', () => {
    it('Debería responder con estado 200', async () => {
      const server = app.listen(); // Obtener el servidor Express
      const response = await request(server).get('/clientes');
      expect(response.status).toBe(200);
      server.close(); // Cerrar el servidor después de realizar la prueba
    });
  });
});
