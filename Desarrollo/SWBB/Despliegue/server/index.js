const cors = require('cors');
const express = require('express');
const multer = require('multer');
const dirname = require('path');
const fileURLToPath = require('url');
const {join} = require('path')

//const CURRENT_DIR = dirname(fileURLToPath(import.meta.url));
const MIMETYPES = ['image/jpeg', 'image/png'];



const cliente = require('./routes/clienteRoutes');
const barbero = require('./routes/barberoRoutes');
const servicio = require('./routes/servicioRoutes');
const { login } = require('./controllers/clienteControllers');
const barberia = require('./routes/barberiaRoutes');
const fotoportafolio = require('./routes/fotoportafolioRoutes');
const reserva = require('./routes/reservaRoutes');
const connection = require('./bdConnection');

const app = express();

app.use(express.json());
app.use(cors());


app.use('/clientes', cliente);
app.use('/barberos', barbero);
app.use('/servicios', servicio);
app.post('/login', login);
app.use('/barberias', barberia);
app.use('/fotoportafolio', fotoportafolio);
app.use('/reservas', reserva);



const multerUpload = multer({
    storage: multer.diskStorage({
        destination: join(__dirname, '../uploads'),
        filename: (req, file, cb) => {
            const fileExtension = extname(file.originalname);
            const fileName = file.originalname.split(fileExtension)[0];

            cb(null, `${fileName}-${Date.now()}${fileExtension}`);
        },
    }),
    fileFilter: (req, file, cb) => {
        if (MIMETYPES.includes(file.mimetype)) cb(null, true);
        else cb(new Error(`Only ${MIMETYPES.join(' ')} mimetypes are allowed`));
    },
    limits: {
        fieldSize: 10000000,
    },
});

app.post('/upload', multerUpload.single('file'), (req, res) => {
    console.log(req.file);

    const q = "INSERT INTO FotoPortafolio (`contenidoFotoPortafolio`, `idBarbero`) VALUES (?)";
    const values = [
        req.body.contenido,
        req.body.idBarbero
    ];

    connection.query(q, [values], (err, data) => {
        if (err) return res.json({ error: "Error al agregar la foto de portafolio brindada" });
        return res.json( "Foto de portafolio agregada exitosamente" );
    });

});

app.use('/public', express.static(join(__dirname, '../uploads')));

app.get("/", (req, res) => {
    res.json("Hello this is backend");
})

app.listen(3000, () => {
    console.log(app.get('title') + ' Connected to backend');
})

// Exporta la aplicación
module.exports = app;