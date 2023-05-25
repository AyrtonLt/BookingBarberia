const connection = require('../bdConnection');

const getServices = (req, res) => {
    const q = "SELECT * FROM Servicio";

    connection.query(q, (err, data) => {
        if (err) return res.json({ error: "Error al obtener los servicios brindados" });
        return res.json(data);
    });
}
const createService = (req, res) => {
    const q = "INSERT INTO Servicio (`nombreServicio`, `descripcionServicio`, `precioServicio`, `estadoServicio`, `Barbero_idBarbero`) VALUES (?)";

    const values = [
        req.body.nombre,
        req.body.descripcion,
        req.body.precio,
        req.body.estado,
        req.body.idBarbero
    ];

    connection.query(q, [values], (err, data) => {
        if (err) return res.json({ error: "Error al agregar el servicio brindado" });
        return res.json( "Servicio brindado agregado exitosamente" );
    });
}
const updateService = (req, res) => {
    const idServicio = req.params.id;
    const q = "UPDATE Servicio SET `nombreServicio` = ?, `descripcionServicio` = ?, `precioServicio` = ?, `estadoServicio` = ?, `Barbero_idBarbero` = ? WHERE idServicio = ?";

    const values = [
        req.body.nombre,
        req.body.descripcion,
        req.body.precio,
        req.body.estado,
        req.body.idBarbero
    ];

    connection.query(q, [...values, idServicio], (err, data) => {
        if(err) return res.json({ error: "Error al modificar el servicio brindado" });
        return res.json( "Servicio brindado modificado exitosamente" );
    });
}
const deleteService = (req, res) => {
    const idServicio = req.params.id;
    const q = "DELETE FROM Servicio WHERE idServicio = ?";

    connection.query(q, [idServicio], (err, data) => {
        if (err) return res.json({ error: "Error al eliminar el servicio brindado" });
        return res.json({ message: "Servicio brindado eliminado exitosamente" });
    });
}

module.exports = {
    getServices,
    createService,
    updateService,
    deleteService
}