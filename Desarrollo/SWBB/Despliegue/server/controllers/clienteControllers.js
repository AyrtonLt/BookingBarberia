const connection = require('../bdConnection');
const jwt = require('jsonwebtoken');

const getUsers = (req, res) => {
    const q = "SELECT * FROM Cliente";

    connection.query(q, (err, data) => {
        if (err) return res.json(err);
        return res.json(data);
    });
};

const createUser = (req, res) => {
    const checkExistingUserQuery = "SELECT * FROM Cliente WHERE correoCliente = ?";
    const q =
        "INSERT INTO Cliente(`nombreCliente`, `apellidoCliente`, `correoCliente`, `passwordCliente`) VALUES (?)";
    const values = [
        req.body.nombre,
        req.body.apellido,
        req.body.correo,
        req.body.pass,
    ];

    // Verificar si ya existe un registro con el mismo correo electrónico
    connection.query(checkExistingUserQuery, [req.body.correo], (err, existingUser) => {
        if (err) return res.json(err);

        if (existingUser.length > 0) {
            // Si se encuentra un registro con el mismo correo electrónico, enviar una respuesta de error
            return res.json({ error: "El correo electrónico ya está registrado" });
        }

        // Si no se encuentra ningún registro con el mismo correo electrónico, crear el nuevo registro
        connection.query(q, [values], (err, data) => {
            if (err) {
                return res.json({ success: false, message: "Error al crear el cliente" });
            } else {
                return res.json({ success: true, message: "Cliente creado exitosamente" });
            }
        });
    });
};

const updateUser = (req, res) => {
    const idCliente = req.params.id;
    const q = "UPDATE Cliente SET `nombreCliente` = ?, `apellidoCliente` = ? WHERE idCliente = ?";

    const values = [req.body.nombre, req.body.apellido];

    connection.query(q, [...values, idCliente], (err, data) => {
        if (err) return res.json(err);
        return res.json("Cliente has been updated succesfully.");
    });
};

const deleteUser = (req, res) => {
    const idCliente = req.params.id;
    const q = "DELETE FROM Cliente WHERE idCliente = ?";

    connection.query(q, [idCliente], (err, data) => {
        if (err) return res.json({ error: "Error al eliminar el cliente" });
        return res.json({ message: "Cliente eliminado exitosamente" });
    });
};

// Modulo de Autenticacion con JSON Web Tokens (JWT)
const login = (req, res) => {
    const { correo, pass } = req.body;

    // Verificar las credenciales en la base de datos
    const query = "SELECT * FROM Cliente WHERE correoCliente = ? AND passwordCliente = ?";
    connection.query(query, [correo, pass], (err, result) => {
        if (err) {
            return res.json({ error: 'Error en la consulta' });
        }

        if (result.length === 0) {
            return res.json({ error: 'Credenciales inválidas' });
        }

        // Generar el token JWT
        const user = result[0];
        const token = jwt.sign({ id: user.idCliente, correo: user.correoCliente }, 'secreto', {
            expiresIn: '1h',
        });
        return res.json({ token });
    });
};

const verifyToken = (req, res, next) => {
    const token = req.headers.authorization;

    if (!token) {
        return res.status(401).json({ error: 'Token no proporcionado' });
    }

    // Verificar y decodificar el token
    jwt.verify(token, 'secreto', (err, decoded) => {
        if (err) {
            return res.status(401).json({ error: 'Token inválido' });
        }
        // Agregar el objeto decodificado al objeto de solicitud
        req.user = decoded;
        next();
    });
};

// Modulo obtener dato del cliente por el ID
const getCustomerById = (req, res) => {
    const idCliente = req.params.id;

    const q = "SELECT * FROM Cliente WHERE idCliente = ?";

    connection.query(q, [idCliente], (err, data) => {
        if (err) return res.json(err);

        if (data.length === 0) {
            return res.json({ error: "Cliente no encontrado" });
        }

        const customerData = data[0];
        return res.json(customerData);
    });
};

module.exports = {
    getUsers,
    createUser,
    updateUser,
    deleteUser,
    login,
    verifyToken,
    getCustomerById,
};
