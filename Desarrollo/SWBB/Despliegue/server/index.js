const cors = require('cors');
const express = require('express');

const cliente = require('./routes/clienteRoutes');
const barbero = require('./routes/barberoRoutes');
const servicio = require('./routes/servicioRoutes');

const app = express();

app.use(express.json());
app.use(cors());


app.use('/clientes', cliente);
app.use('/barberos', barbero);
app.use('/servicios', servicio);

app.get("/", (req, res) => {
    res.json("Hello this is backend");
})

app.listen(3000, () => {
    console.log(app.get('title') + 'Connected to backend');
})