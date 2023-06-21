const request = require('supertest');
const app = require('../index'); // Importa tu aplicación Express
const connection = require('../bdConnection');

describe('Cliente Controller', () => {
  test('Obtener todos los clientes', async () => {
    const response = await request(app).get('/clientes');
    expect(response.statusCode).toBe(200);
    expect(response.body).toEqual(expect.any(Array));
  });

  test('Crear un nuevo usuario', async () => {
    const newUser = {
      nombre: 'John',
      apellido: 'Doe',
      correo: 'johndoe@example3.com',
      pass: 'password123',
    };

    const response = await request(app).post('/clientes').send(newUser);
    expect(response.statusCode).toBe(200);

    if (response.body.success === true) {
      expect(response.body).toEqual(expect.objectContaining({ success: true }));
    } else {
      expect(response.body).toEqual(expect.objectContaining({ error: "El correo electrónico ya está registrado" }));
    }
  });

  test('Actualizar un usuario existente', async () => {
    const updatedUser = {
      nombre: 'Jane',
      apellido: 'Doe',
    };

    const response = await request(app).put('/clientes/1').send(updatedUser);
    expect(response.statusCode).toBe(200);
    expect(response.body).toBe('Cliente has been updated succesfully.');
  });

  test('Eliminar un usuario existente', async () => {
    const response = await request(app).delete('/clientes/5');
    expect(response.statusCode).toBe(200);
    expect(response.body).toEqual(expect.objectContaining({ message: 'Cliente eliminado exitosamente' }));
  });

  test('Iniciar sesión con credenciales válidas', async () => {
    const credentials = {
      correo: 'johndoe@example.com',
      pass: 'password123',
    };

    const response = await request(app).post('/login').send(credentials);
    expect(response.statusCode).toBe(200);
    expect(response.body).toHaveProperty('token');
  });

  test('Obtener datos de un cliente por ID (requiere token)', async () => {
    // Primero, iniciar sesión para obtener un token válido
    const credentials = {
      correo: 'johndoe@example3.com',
      pass: 'password123',
    };

    const loginResponse = await request(app).post('/login').send(credentials);
    const token = loginResponse.body.token;

    // Luego, realizar la solicitud GET con el token en los encabezados
    const response = await request(app)
      .get('/clientes/1')
      .set('Authorization', token);

    expect(response.statusCode).toBe(200);
    expect(response.body).toEqual(expect.objectContaining({ idCliente: 1 }));
  });
});
