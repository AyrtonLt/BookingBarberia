const axios = require('axios');

const loginUrl = 'http://localhost:3000/login';

// Datos de inicio de sesión
const credentials = {
    correo: 'test@test.com',
    pass: '1234'
};

axios.post(loginUrl, credentials)
    .then(response => {
        // La solicitud se completó con éxito
        console.log('Autenticación exitosa');
        console.log('Token JWT:', response.data.token);
    })
    .catch(error => {
        // Ocurrió un error en la solicitud
        console.error('Error de autenticación:', error.response.data.error);
    });
