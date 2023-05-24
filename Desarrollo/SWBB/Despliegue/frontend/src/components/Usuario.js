import React, { useState } from 'react';
import Informacion from './Informacion';

const Usuario = () => {
    const [mostrarInformacion, setMostrarInformacion] = useState(false);

    const handleMostrarInformacion = () => {
        setMostrarInformacion(true);
    }

    return (
        <div>
            <h2>Usuario</h2>
            <div>
                {/* Foto del usuario */}
                <img src="" alt="Foto del usuario" />
                {/* Nombre del usuario */}
                <h3>Nombre del usuario</h3>
            </div>
            <div>
                {/* Barra de búsqueda */}
                <input type="text" placeholder="Buscar" />
            </div>
            <div>
                <h4>Barberos concurrentes</h4>
                {/* Carrusel de Barberos concurrentes */}
                <div>
                    {/* Imagen del barbero */}
                    <img src="" alt="Foto del barbero" />
                    {/* Nombre del barbero */}
                    <h5>Nombre del barbero</h5>
                    {/* Botón "Solicitar servicio" */}
                    <button>Solicitar servicio</button>
                </div>
            </div>
            <div>
                <h4>Mis cortes</h4>
                {/* Carrusel de las fotos de "mis cortes" */}
                <div>
                    {/* Imagen del corte */}
                    <img src="" alt="Foto del corte" />
                </div>
            </div>
            {/* Botón para mostrar el componente Informacion */}
            {!mostrarInformacion && (
                <button onClick={handleMostrarInformacion}>Actualizar información</button>
            )}
            {/* Mostrar el componente Informacion si mostrarInformacion es true */}
            {mostrarInformacion && <Informacion />}
            {/* Footbar */}
            <div className="Footbar">
                {/* Opciones del footbar */}
            </div>
        </div>
    );
};

export default Usuario;
