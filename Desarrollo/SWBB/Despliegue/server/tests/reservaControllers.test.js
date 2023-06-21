const request = require('supertest');
const app = require('../index');
const connection = require('../bdConnection');

describe('Reserva Controller', () => {
  afterAll(() => {
    connection.end();
  });

  beforeEach(() => {
    // Aquí puedes añadir lógica de preparación antes de cada test si es necesario
  });

  afterEach(() => {
    // Aquí puedes añadir lógica de limpieza después de cada test si es necesario
  });

  describe('GET /reservas', () => {
    it('debería obtener todas las reservas', async () => {
      const response = await request(app).get('/reservas');
      expect(response.status).toBe(200);
      // Asegúrate de verificar el cuerpo de la respuesta según tu implementación
    });

    // Agrega más tests para los diferentes casos que desees probar
  });

  describe('POST /reservas', () => {
    it('debería crear una nueva reserva', async () => {
      const reserva = {
        fecha: '2023-05-24',
        hora: '10:00',
        idBarbero: 1,
        idCliente: 1
      };

      const response = await request(app).post('/reservas').send(reserva);
      expect(response.status).toBe(200);
      // Asegúrate de verificar el cuerpo de la respuesta según tu implementación
    });

    // Agrega más tests para los diferentes casos que desees probar
  });

  describe('PUT /reservas/:id', () => {
    it('debería actualizar una reserva existente', async () => {
      const reservaId = 1;
      const estadoReserva = 'aceptada';

      const response = await request(app).put(`/reservas/${reservaId}`).send({ estado: estadoReserva });
      expect(response.status).toBe(200);
      // Asegúrate de verificar el cuerpo de la respuesta según tu implementación
    });

    // Agrega más tests para los diferentes casos que desees probar
  });

  describe('DELETE /reservas/:id', () => {
    it('debería eliminar una reserva existente', async () => {
      const reservaId = 1;

      const response = await request(app).delete(`/reservas/${reservaId}`);
      expect(response.status).toBe(200);
      // Asegúrate de verificar el cuerpo de la respuesta según tu implementación
    });

    // Agrega más tests para los diferentes casos que desees probar
  });
});
