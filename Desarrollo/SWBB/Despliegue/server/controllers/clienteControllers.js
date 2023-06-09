const connection = require('../bdConnection');

const getUsers = (req, res) => {
    const q = "SELECT * FROM Cliente"

    connection.query(q, (err, data) => {
        if (err) return res.json(err);
        return res.json(data);
    })
}
const createUser = (req, res) => {
    const q = "INSERT INTO Cliente(`nombreCliente`, `apellidoCliente`, `correoCliente`, `passwordCliente`) VALUES (?)";
    const values = [
        req.body.nombre,
        req.body.apellido,
        req.body.correo,
        req.body.pass
    ]

    connection.query(q, [values], (err, data) => {
        if (err) return res.json(err);
        return res.json("cliente has been created succesfully!");
    });
}
const updateUser = (req, res) => {
    const idCliente = req.params.id;
    const q = "UPDATE Cliente SET `nombreCliente` = ?, `apellidoCliente` = ? WHERE idCliente = ?"

    const values = [
        req.body.nombre,
        req.body.apellido,
    ];

    connection.query(q, [...values, idCliente], (err, data) => {
        if(err) return res.json(err);
        return res.json("Cliente has been updated succesfully.");
    });

}
const deleteUser = (req, res) => {
    const idCliente = req.params.id;
    const q = "DELETE FROM Cliente WHERE idCliente = ?";

    connection.query(q, [idCliente], (err, data) => {
        if (err) return res.json({ error: "Error al eliminar el cliente" });
        return res.json({ message: "Cliente eliminado exitosamente" });
    });
}
module.exports = {
    getUsers,
    createUser,
    updateUser,
    deleteUser
}