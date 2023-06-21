const request = require('supertest');
const express = require('express');
const app = express();

// Importar las funciones del controlador
const {
  getUsers,
  createUser,
  updateUser,
  deleteUser,
  login,
  verifyToken,
  getCustomerById,
} = require('../controllers/clienteControllers');

// Configurar el servidor de prueba
app.use(express.json());
app.get('/users', getUsers);
app.post('/users', createUser);
app.put('/users/:id', updateUser);
app.delete('/users/:id', deleteUser);
app.post('/login', login);
app.get('/customer/:id', verifyToken, getCustomerById);

describe('Cliente Controller', () => {
  test('Obtener todos los usuarios', async () => {
    const response = await request(app).get('/users');
    expect(response.statusCode).toBe(200);
    expect(response.body).toEqual(expect.any(Array));
  });

  test('Crear un nuevo usuario', async () => {
    const newUser = {
      nombre: 'John',
      apellido: 'Doe',
      correo: 'johndoe@example.com',
      pass: 'password123',
    };

    const response = await request(app).post('/users').send(newUser);
    expect(response.statusCode).toBe(200);
    expect(response.body).toEqual(expect.objectContaining({ success: true }));
  });

  test('Actualizar un usuario existente', async () => {
    const updatedUser = {
      nombre: 'Jane',
      apellido: 'Doe',
    };

    const response = await request(app).put('/users/1').send(updatedUser);
    expect(response.statusCode).toBe(200);
    expect(response.body).toBe('Cliente has been updated succesfully.');
  });

  test('Eliminar un usuario existente', async () => {
    const response = await request(app).delete('/users/1');
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
      correo: 'johndoe@example.com',
      pass: 'password123',
    };

    const loginResponse = await request(app).post('/login').send(credentials);
    const token = loginResponse.body.token;

    // Luego, realizar la solicitud GET con el token en los encabezados
    const response = await request(app)
      .get('/customer/1')
      .set('Authorization', token);

    expect(response.statusCode).toBe(200);
    expect(response.body).toEqual(expect.objectContaining({ idCliente: 1 }));
  });
});
