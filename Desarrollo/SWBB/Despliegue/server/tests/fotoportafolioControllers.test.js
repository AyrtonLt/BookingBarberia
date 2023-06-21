const request = require('supertest');
const app = require('../index');
const connection = require('../bdConnection');

describe('Foto Portafolio Controller', () => {
  afterAll(() => {
    connection.end();
  });

  beforeEach(() => {
    // Aquí puedes añadir lógica de preparación antes de cada test si es necesario
  });

  afterEach(() => {
    // Aquí puedes añadir lógica de limpieza después de cada test si es necesario
  });

  describe('GET /fotoportafolio', () => {
    it('should return all fotos del portafolio', async () => {
      const response = await request(app).get('/fotoportafolio');

      expect(response.status).toBe(200);
      expect(response.body).toEqual(expect.any(Array));
    });
  });

  describe('POST /fotoportafolio', () => {
    it('should create a new foto del portafolio', async () => {
      const newFoto = {
        contenidoFotoPortafolio: '...',
        Barbero_idBarbero: 1
      };

      const response = await request(app)
        .post('/fotoportafolio')
        .send(newFoto);

      expect(response.status).toBe(200);
      expect(response.body).toEqual('Foto del portafolio agregada exitosamente');
    });
  });

  describe('PUT /fotoportafolio/:id', () => {
    it('should update an existing foto del portafolio', async () => {
      const id = 1;
      const updatedFoto = {
        contenidoFotoPortafolio: '...',
        Barbero_idBarbero: 1
      };

      const response = await request(app)
        .put(`/fotoportafolio/${id}`)
        .send(updatedFoto);

      expect(response.status).toBe(200);
      expect(response.body).toEqual('Foto del portafolio modificada exitosamente');
    });
  });

  describe('DELETE /fotoportafolio/:id', () => {
    it('should delete an existing foto del portafolio', async () => {
      const id = 1;

      const response = await request(app).delete(`/fotoportafolio/${id}`);

      expect(response.status).toBe(200);
      expect(response.body).toEqual({ message: 'Foto del portafolio eliminada exitosamente' });
    });
  });

  describe('GET /fotoportafolio/:id', () => {
    it('should return the foto del portafolio for a specific Barbero', async () => {
      const id = 1;

      const response = await request(app).get(`/fotoportafolio/${id}`);

      expect(response.status).toBe(200);
      expect(response.header['content-type']).toContain('image/jpeg');
    });
  });
});
