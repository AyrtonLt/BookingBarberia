const request = require('supertest');
const app = require('../index');
const connection = require('../bdConnection');

describe('Servicio Controller', () => {
  afterAll(() => {
    connection.end();
  });

  beforeEach(() => {
    // Aquí puedes añadir lógica de preparación antes de cada test si es necesario
  });

  afterEach(() => {
    // Aquí puedes añadir lógica de limpieza después de cada test si es necesario
  });

  describe('GET /servicios', () => {
    it('debería obtener todos los servicios', async () => {
      const response = await request(app).get('/servicios');
      expect(response.status).toBe(200);
      // Asegúrate de verificar el cuerpo de la respuesta según tu implementación
    });

    // Agrega más tests para los diferentes casos que desees probar
  });

  describe('POST /servicios', () => {
    it('debería crear un nuevo servicio', async () => {
      const servicio = {
        nombre: 'Nombre del servicio',
        descripcion: 'Descripción del servicio',
        precio: 10.99,
        estado: 'activo',
        idBarbero: 1
      };

      const response = await request(app).post('/servicios').send(servicio);
      expect(response.status).toBe(200);
      // Asegúrate de verificar el cuerpo de la respuesta según tu implementación
    });

    // Agrega más tests para los diferentes casos que desees probar
  });

  describe('PUT /servicios/:id', () => {
    it('debería actualizar un servicio existente', async () => {
      const servicioId = 1;
      const servicio = {
        nombre: 'Nuevo nombre del servicio',
        descripcion: 'Nueva descripción del servicio',
        precio: 19.99,
        estado: 'inactivo',
        idBarbero: 2
      };

      const response = await request(app).put(`/servicios/${servicioId}`).send(servicio);
      expect(response.status).toBe(200);
      // Asegúrate de verificar el cuerpo de la respuesta según tu implementación
    });

    // Agrega más tests para los diferentes casos que desees probar
  });

  describe('DELETE /servicios/:id', () => {
    it('debería eliminar un servicio existente', async () => {
      const servicioId = 1;

      const response = await request(app).delete(`/servicios/${servicioId}`);
      expect(response.status).toBe(200);
      // Asegúrate de verificar el cuerpo de la respuesta según tu implementación
    });

    // Agrega más tests para los diferentes casos que desees probar
  });
});
