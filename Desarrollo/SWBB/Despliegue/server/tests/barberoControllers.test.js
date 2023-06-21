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

describe('Barbero Controller', () => {
  // Prueba para obtener todos los barberos
  describe('GET /barberos', () => {
    it('debe retornar un código de estado 200 y un array de barberos', async () => {
      const response = await request(app).get('/barberos');
      expect(response.status).toBe(200);
      expect(Array.isArray(response.body)).toBe(true);
    });
  });

  // Prueba para crear un barbero
  describe('POST /barberos', () => {
    it('debe crear un nuevo barbero y retornar un código de estado 200', async () => {
      const nuevoBarbero = {
        nombre: 'Nombre Barbero',
        apellido: 'Apellido Barbero',
        apodo: 'Apodo Barbero',
        correo: 'correo@barbero.com',
        pass: 'contraseña',
        desc: 'Descripción Barbero',
        telefono: '123456789',
        fotoperfil: 'ruta/foto.jpg',
        idBarberia: 1
      };

      const response = await request(app)
        .post('/barberos')
        .send(nuevoBarbero);

      expect(response.status).toBe(200);
    });
  });

  // Prueba para actualizar un barbero
  describe('PUT /barberos/:id', () => {
    it('debe actualizar un barbero existente y retornar un código de estado 200', async () => {
      const barberoActualizado = {
        nombre: 'Nuevo Nombre',
        apellido: 'Nuevo Apellido',
        apodo: 'Nuevo Apodo',
        desc: 'Nueva Descripción',
        telefono: '987654321',
        fotoperfil: 'ruta/nueva_foto.jpg'
      };

      const response = await request(app)
        .put('/barberos/1')
        .send(barberoActualizado);

      expect(response.status).toBe(200);
    });
  });

  // Prueba para eliminar un barbero
  describe('DELETE /barberos/:id', () => {
    it('debe eliminar un barbero existente y retornar un código de estado 200', async () => {
      const response = await request(app).delete('/barberos/1');
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
