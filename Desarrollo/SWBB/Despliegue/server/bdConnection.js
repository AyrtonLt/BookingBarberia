const mysql = require('mysql')
const { mysql_database } = require('./config/bdProperties')

const connection = mysql.createConnection(mysql_database)

connection.connect((err, conn)=>{
    if (err) {
        console.log('Ha ocurrido un error al conectarse')
    }else{
        console.log('Conexión exitosa')
        return conn
    }
})

module.exports = connection