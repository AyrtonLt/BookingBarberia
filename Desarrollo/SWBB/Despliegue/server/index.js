import express from 'express';
import mysql from "mysql";
import cors from "cors";

const app = express();

const db = mysql.createConnection({
    host: "localhost",
    user: "root",
    password: "123456.",
    database: "test"
})

app.use(express.json());
app.use(cors());

app.get("/", (req, res) => {
    res.json("Hello this is backend");
})

/*app.get("/books", (req, res) => {
    const q = "SELECT * FROM book"
    db.query(q, (err, data) => {
        if (err) return res.json(err);
        return res.json(data);
    })
})*/

//Funcionalidad CREAR USUARIOS
app.post("/clientes", (req, res) => {
    const q = "INSERT INTO Cliente(`nombreCliente`, `apellidoCliente`, `correoCliente`, `passwordCliente`) VALUES (?)";
    const values = [
        req.body.nombre,
        req.body.apellido,
        req.body.correo,
        req.body.pass
    ]

    db.query(q, [values], (err, data) => {
        if (err) return res.json(err);
        return res.json("cliente has been created succesfully!");
    });
})

app.post("/barberos", (req, res) => {
    const q = "INSERT INTO Cliente(`nombreBarbero`, `apellidoBarbero`, `apodoBarbero`, `correoBarbero`, `passwordBarbero`, `descripcionBarbero`, `telefonoBarbero`, `contenidoFotoPerfilBarbero`, `Barberia_idBarberia`) VALUES (?)";
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

    db.query(q, [values], (err, data) => {
        if (err) return res.json(err);
        return res.json("barbero has been created succesfully!");
    });
})

//Funcionalidad GESTIONAR INFORMACION PERSONAL
app.put("/clientes/:id", (req, res) => {
    const idCliente = req.params.id;
    const q = "UPDATE book SET `nombreCliente` = ?, `apellidoCliente` = ? WHERE idCliente = ?"

    const values = [
        req.body.nombre,
        req.body.apellido,
    ];

    db.query(q, [...values, idCliente], (err, data) => {
        if(err) return res.json(err);
        return res.json("Cliente has been updated succesfully.");
    });
})

app.put("/barberos/:id", (req, res) => {
    const idBarbero = req.params.id;
    const q = "UPDATE book SET `nombreBarbero` = ?, `apellidoBarbero` = ? `apodoBarbero` = ?, `descripcionBarbero` = ?, `telefonoBarbero` = ?, `contenidoFotoPerfilBarbero` = ? WHERE idBarbero = ?"

    const values = [
        req.body.nombre,
        req.body.apellido,
        req.body.apodo,
        req.body.desc,
        req.body.telefono,
        req.body.fotoperfil,
    ];

    db.query(q, [...values, idBarbero], (err, data) => {
        if(err) return res.json(err);
        return res.json("Barbero has been updated succesfully.");
    });
})

//Funcionalidad gestionar servicios brindados

app.get("/servicios", (req, res) => {
    const q = "SELECT * FROM Servicio";

    db.query(q, (err, data) => {
        if (err) return res.json({ error: "Error al obtener los servicios brindados" });
        return res.json(data);
    });
});
//agregar
app.post("/servicios", (req, res) => {
    const q = "INSERT INTO Servicio (`nombreServicio`, `descripcionServicio`, `precioServicio`, `estadoServicio`, `Barbero_idBarbero`) VALUES (?)";

    const values = [
        req.body.nombre,
        req.body.descripcion,
        req.body.precio,
        req.body.estado,
        req.body.idBarbero
    ];

    db.query(q, [values], (err, data) => {
        if (err) return res.json({ error: "Error al agregar el servicio brindado" });
        return res.json( "Servicio brindado agregado exitosamente" );
    });
});
//modificar
app.put("/servicios/:id", (req, res) => {
    const idServicio = req.params.id;
    const q = "UPDATE Servicio SET `nombreServicio` = ?, `descripcionServicio` = ?, `precioServicio` = ?, `estadoServicio` = ?, `Barbero_idBarbero` = ? WHERE idServicio = ?";

    const values = [
        req.body.nombre,
        req.body.descripcion,
        req.body.precio,
        req.body.estado,
        req.body.idBarbero
    ];

    db.query(q, [...values, idServicio], (err, data) => {
        if(err) return res.json({ error: "Error al modificar el servicio brindado" });
        return res.json( "Servicio brindado modificado exitosamente" );
    });
});
//eliminar
app.delete("/servicios/:id", (req, res) => {
    const idServicio = req.params.id;
    const q = "DELETE FROM Servicio WHERE idServicio = ?";
  
    db.query(q, [idServicio], (err, data) => {
      if (err) return res.json({ error: "Error al eliminar el servicio brindado" });
      return res.json({ message: "Servicio brindado eliminado exitosamente" });
    });
  });

/*app.post("/books", (req, res) => {
    const q = "INSERT INTO book (`bookTitle`, `bookDesc`, `bookPrice`, `bookCover`) VALUES (?)";
    const values = [
        req.body.title,
        req.body.desc,
        req.body.price,
        req.body.cover
    ];

    db.query(q, [values], (err, data) => {
        if (err) return res.json(err);
        return res.json("book has been created succesfully!");
    });
});*/

/*app.delete("/books/:id", (req, res) => {
    const bookId = req.params.id;
    const q = "DELETE FROM book where bookID = ?"

    db.query(q, [bookId], (err, data) => {
        if(err) return res.json(err);
        return res.json("Book has been deleted succesfully.");
    });
});*/

/*app.put("/books/:id", (req, res) => {
    const bookId = req.params.id;
    const q = "UPDATE book SET `bookTitle` = ?, `bookDesc` = ?, `bookPrice` = ?, `bookCover` = ? WHERE bookId = ?"

    const values = [
        req.body.title,
        req.body.desc,
        req.body.price,
        req.body.cover
    ];

    db.query(q, [...values, bookId], (err, data) => {
        if(err) return res.json(err);
        return res.json("Book has been updated succesfully.");
    });
})*/

app.listen(3000, () => {
    console.log("Connected to backend")
})