const connection = require('../bdConnection');

const getBarberias = (req, res) => {
  const q = "SELECT * FROM barberia";

  connection.query(q, (err, data) => {
    if (err) return res.json({ error: "Error al obtener las barberías" });
    return res.json(data);
  });
};

const createBarberia = (req, res) => {
  const q = "INSERT INTO barberia (`nombreBarberia`, `direccionBarberia`, `Distrito_idDistrito`) VALUES (?)";

  const values = [
    req.body.nombre,
    req.body.direccion,
    req.body.idDistrito
  ];

  connection.query(q, [values], (err, data) => {
    if (err) return res.json({ error: "Error al agregar la barbería" });
    return res.json("Barbería agregada exitosamente");
  });
};

const updateBarberia = (req, res) => {
  const idBarberia = req.params.id;
  const q = "UPDATE barberia SET `nombreBarberia` = ?, `direccionBarberia` = ?, `Distrito_idDistrito` = ? WHERE idBarberia = ?";

  const values = [
    req.body.nombre,
    req.body.direccion,
    req.body.idDistrito
  ];

  connection.query(q, [...values, idBarberia], (err, data) => {
    if (err) return res.json({ error: "Error al modificar la barbería" });
    return res.json("Barbería modificada exitosamente");
  });
};

const deleteBarberia = (req, res) => {
  const idBarberia = req.params.id;
  const q = "DELETE FROM barberia WHERE idBarberia = ?";

  connection.query(q, [idBarberia], (err, data) => {
    if (err) return res.json({ error: "Error al eliminar la barbería" });
    return res.json({ message: "Barbería eliminada exitosamente" });
  });
};

module.exports = {
  getBarberias,
  createBarberia,
  updateBarberia,
  deleteBarberia
};
