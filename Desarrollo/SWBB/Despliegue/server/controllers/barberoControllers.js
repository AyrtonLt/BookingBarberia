const connection = require('../bdConnection');
//añadido
const reservaControllers = require('./reservaControllers');//


const getUsers = (req, res) => {
    const q = "SELECT * FROM Barbero"
    connection.query(q,async (err, data) => {
        if (err) return res.json(err);
        return res.json(data);

       //añadido (Obtener las reservas asociadas a cada barbero)
       const barberos = JSON.parse(JSON.stringify(data)); 
       for (const barbero of barberos) {
           const reservas = await reservaControllers.getReservationsByBarber(barbero.idBarbero);
           const reservasAceptadas = await reservaControllers.getAcceptedReservationsByBarber(barbero.idBarbero);
           barbero.reservas = reservas;
           barbero.reservasAceptadas = reservasAceptadas;
       }

       return res.json(barberos);
    });
}
const createUser = (req, res) => {
    const q = "INSERT INTO Barbero(`nombreBarbero`, `apellidoBarbero`, `apodoBarbero`, `correoBarbero`, `passwordBarbero`, `descripcionBarbero`, `telefonoBarbero`, `contenidoFotoPerfilBarbero`, `Barberia_idBarberia`) VALUES (?)";
    const values = [
        req.body.nombre,
        req.body.apellido,
        req.body.apodo,
        req.body.correo,
        req.body.pass,
        req.body.desc,
        req.body.telefono,
        req.body.fotoperfil,
        req.body.idBarberia,
    ]

    connection.query(q, [values], (err, data) => {
        if (err) return res.json(err);
        return res.json("barbero has been created succesfully!");
    });
}
const updateUser = (req, res) => {
    const idBarbero = req.params.id;
    const q = "UPDATE Barbero SET `nombreBarbero` = ?, `apellidoBarbero` = ? `apodoBarbero` = ?, `descripcionBarbero` = ?, `telefonoBarbero` = ?, `contenidoFotoPerfilBarbero` = ? WHERE idBarbero = ?"

    const values = [
        req.body.nombre,
        req.body.apellido,
        req.body.apodo,
        req.body.desc,
        req.body.telefono,
        req.body.fotoperfil,
    ];

    connection.query(q, [...values, idBarbero], (err, data) => {
        if(err) return res.json(err);
        return res.json("Barbero has been updated succesfully.");
    });
}
const deleteUser = (req, res) => {
    const idBarbero = req.params.id;
    const q = "DELETE FROM Barbero WHERE idBarbero = ?";

    connection.query(q, [idBarbero], (err, data) => {
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
