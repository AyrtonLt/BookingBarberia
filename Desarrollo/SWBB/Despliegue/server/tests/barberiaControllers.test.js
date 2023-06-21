const request = require('supertest');
const app = require('../index'); // Importa tu aplicación Express
const connection = require('../bdConnection'); // Importa tu archivo de conexión a la base de datos

// Antes de las pruebas, establece una conexión a la base de datos
beforeAll(done => {
  connection.connect(err => {
    if (err) {
      console.error('Error al conectar a la base de datos', err);
      done();
    } else {
      console.log('Conexión exitosa a la base de datos');
      done();
    }
  });
});

// Después de las pruebas, cierra la conexión a la base de datos
afterAll(done => {
  connection.end(err => {
    if (err) {
      console.error('Error al cerrar la conexión a la base de datos', err);
      done();
    } else {
      console.log('Conexión a la base de datos cerrada');
      done();
    }
  });
});

describe('Barberia Controller', () => {
  // Prueba para obtener todas las barberías
  describe('GET /barberias', () => {
    it('debe retornar un código de estado 200 y un array de barberías', async () => {
      const response = await request(app).get('/barberias');
      expect(response.status).toBe(200);
      expect(Array.isArray(response.body)).toBe(true);
    });
  });

  // Prueba para crear una barbería
  describe('POST /barberias', () => {
    it('debe crear una nueva barbería y retornar un código de estado 200', async () => {
      const nuevaBarberia = {
        nombre: 'Barbería Test',
        direccion: 'Dirección de prueba',
        idDistrito: 1
      };

      const response = await request(app)
        .post('/barberias')
        .send(nuevaBarberia);

      expect(response.status).toBe(200);
    });
  });

  // Prueba para actualizar una barbería
  describe('PUT /barberias/:id', () => {
    it('debe actualizar una barbería existente y retornar un código de estado 200', async () => {
      const barberiaActualizada = {
        nombre: 'Nuevo Nombre',
        direccion: 'Nueva Dirección',
        idDistrito: 2
      };

      const response = await request(app)
        .put('/barberias/1')
        .send(barberiaActualizada);

      expect(response.status).toBe(200);
    });
  });

  // Prueba para eliminar una barbería
  describe('DELETE /barberias/:id', () => {
    it('debe eliminar una barbería existente y retornar un código de estado 200', async () => {
      const response = await request(app).delete('/barberias/1');
      expect(response.status).toBe(200);
    });
  });

  // Después de cada prueba, cierra la conexión a la base de datos
  afterEach(done => {
    connection.end(err => {
      if (err) {
        console.error('Error al cerrar la conexión a la base de datos', err);
        done();
      } else {
        console.log('Conexión a la base de datos cerrada');
        done();
      }
    });
  });
});
