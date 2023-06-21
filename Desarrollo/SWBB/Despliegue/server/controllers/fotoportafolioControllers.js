const connection = require('../bdConnection');

const getFotoPortafolio = (req, res) => {
  const q = "SELECT * FROM fotoportafolio";

  connection.query(q, (err, data) => {
    if (err) return res.json({ error: "Error al obtener las fotos del portafolio" });
    return res.json(data);
  });
};

const createFotoPortafolio = (req, res) => {
  const q = "INSERT INTO fotoportafolio (`contenidoFotoPortafolio`, `Barbero_idBarbero`) VALUES (?, ?)";

  const values = [
    req.body.contenidoFotoPortafolio,
    req.body.Barbero_idBarbero
  ];

  connection.query(q, values, (err, data) => {
    if (err) return res.json({ error: "Error al agregar la foto al portafolio" });
    return res.json("Foto del portafolio agregada exitosamente");
  });
};

const updateFotoPortafolio = (req, res) => {
  const idFotoPortafolio = req.params.id;
  const q = "UPDATE fotoportafolio SET `contenidoFotoPortafolio` = ?, `Barbero_idBarbero` = ? WHERE idFotoPortafolio = ?";

  const values = [
    req.body.contenidoFotoPortafolio,
    req.body.Barbero_idBarbero,
    idFotoPortafolio
  ];

  connection.query(q, values, (err, data) => {
    if (err) return res.json({ error: "Error al modificar la foto del portafolio" });
    return res.json("Foto del portafolio modificada exitosamente");
  });
};

const deleteFotoPortafolio = (req, res) => {
  const idFotoPortafolio = req.params.id;
  const q = "DELETE FROM fotoportafolio WHERE idFotoPortafolio = ?";

  connection.query(q, [idFotoPortafolio], (err, data) => {
    if (err) return res.json({ error: "Error al eliminar la foto del portafolio" });
    return res.json({ message: "Foto del portafolio eliminada exitosamente" });
  });
};

const getFotoPortafolioByBarbero = (req, res) => {
  const Barbero_idBarbero = req.params.id;
  const q = "SELECT contenidoFotoPortafolio FROM fotoportafolio WHERE Barbero_idBarbero = ?";

  connection.query(q, [Barbero_idBarbero], (err, data) => {
    if (err) return res.json({ error: "Error al obtener la foto del portafolio" });

    if (data.length === 0) {
      return res.json({ error: "No se encontró ninguna foto del portafolio para el barbero" });
    }

    const image = data[0].contenidoFotoPortafolio;
    res.setHeader("Content-Type", "image/jpeg"); // Establecer el tipo de contenido como imagen/jpeg

    return res.end(image);
  });
};

module.exports = {
  getFotoPortafolio,
  createFotoPortafolio,
  updateFotoPortafolio,
  deleteFotoPortafolio,
  getFotoPortafolioByBarbero
};
