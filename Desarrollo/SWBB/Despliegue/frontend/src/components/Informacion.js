import React, { useState } from 'react';

const Informacion = () => {
    const [nombres, setNombres] = useState('');
    const [apellidos, setApellidos] = useState('');
    const [region, setRegion] = useState('');
    const [ciudad, setCiudad] = useState('');

    const handleActualizarInformacion = () => {
        // Agrega aquí la lógica para actualizar la información del usuario
    };

    return (
        <div>
            <h2>Información de Usuario</h2>
            <img src="images/barbero.jpg" alt="Barbero" />
            <form onSubmit={handleActualizarInformacion}>
                <input
                    type="text"
                    placeholder="Nombres"
                    value={nombres}
                    onChange={(e) => setNombres(e.target.value)}
                />
                <input
                    type="text"
                    placeholder="Apellidos"
                    value={apellidos}
                    onChange={(e) => setApellidos(e.target.value)}
                />
                <input
                    type="text"
                    placeholder="Región"
                    value={region}
                    onChange={(e) => setRegion(e.target.value)}
                />
                <input
                    type="text"
                    placeholder="Ciudad"
                    value={ciudad}
                    onChange={(e) => setCiudad(e.target.value)}
                />
                <button type="submit">Actualizar Información</button>
            </form>
        </div>
    );
};

export default Informacion;
