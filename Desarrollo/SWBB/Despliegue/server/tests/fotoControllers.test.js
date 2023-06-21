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

describe('Foto Controller', () => {
  // Prueba para crear una foto
  describe('POST /upload', () => {
    it('debe crear una nueva foto y retornar un código de estado 200', async () => {
      const nuevaFoto = {
        contenido: 'contenido de la foto',
        idBarbero: 1
      };

      const response = await request(app)
        .post('/upload')
        .send(nuevaFoto);

      expect(response.status).toBe(200);
    });
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
