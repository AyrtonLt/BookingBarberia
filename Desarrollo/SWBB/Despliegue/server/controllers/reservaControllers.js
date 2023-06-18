const connection = require('../bdConnection');

const getReservations = (req, res) => {
    const q = "SELECT * FROM Reserva";

    connection.query(q, (err, data) => {
        if (err) return res.json({ error: "Error al obtener las reservas" });
        return res.json(data);
    });
};

const getReservationsByBarber = (barberoId) => {
    const q = "SELECT * FROM Reserva WHERE Barbero_idBarbero = ?";

    return new Promise((resolve, reject) => {
        connection.query(q, [barberoId], (err, data) => {
            if (err) {
                reject(err);
            } else {
                resolve(data);
            }
        });
    });
};

const getAcceptedReservationsByBarber = (barberoId) => {
    const q = "SELECT * FROM Reserva WHERE Barbero_idBarbero = ? AND estadoReserva = 'aceptada'";

    return new Promise((resolve, reject) => {
        connection.query(q, [barberoId], (err, data) => {
            if (err) {
                reject(err);
            } else {
                resolve(data);
            }
        });
    });
};

const createReservation = (req, res) => {
    const q = "INSERT INTO Reserva (`fechaReserva`, `horaReserva`, `Barbero_idBarbero`, `Cliente_idCliente`, `estadoReserva`) VALUES (?)";

    const values = [
        req.body.fecha,
        req.body.hora,
        req.body.idBarbero,
        req.body.idCliente,
        'pendiente', // Estado inicial de la reserva
    ];

    connection.query(q, [values], (err, data) => {
        if (err) return res.json({ error: "Error al crear la reserva" });
        return res.json("Reserva creada exitosamente");
    });
};

const updateReservation = (req, res) => {
    const idReserva = req.params.id;
    const estadoReserva = req.body.estado;

    const q = "UPDATE Reserva SET `estadoReserva` = ? WHERE idReserva = ?";

    connection.query(q, [estadoReserva, idReserva], (err, data) => {
        if (err) return res.json({ error: "Error al actualizar la reserva" });
        return res.json("Reserva actualizada exitosamente");
    });
};

const deleteReservation = (req, res) => {
    const idReserva = req.params.id;
    const q = "DELETE FROM Reserva WHERE idReserva = ?";

    connection.query(q, [idReserva], (err, data) => {
        if (err) return res.json({ error: "Error al eliminar la reserva" });
        return res.json("Reserva eliminada exitosamente");
    });
};

module.exports = {
    getReservations,
    createReservation,
    updateReservation,
    deleteReservation,
    getReservationsByBarber,
    getAcceptedReservationsByBarber
};
