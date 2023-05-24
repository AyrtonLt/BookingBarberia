import React from 'react';

const Footbar = ({ selectedOption, onOptionChange }) => {
    return (
        <div className="Footbar">
            <button
                className={selectedOption === 'usuario' ? 'active' : ''}
                onClick={() => onOptionChange('usuario')}
            >
                Usuario
            </button>
            <button
                className={selectedOption === 'citas' ? 'active' : ''}
                onClick={() => onOptionChange('citas')}
            >
                Citas
            </button>
            <button
                className={selectedOption === 'busqueda' ? 'active' : ''}
                onClick={() => onOptionChange('busqueda')}
            >
                Búsqueda
            </button>
            <button
                className={selectedOption === 'config' ? 'active' : ''}
                onClick={() => onOptionChange('config')}
            >
                Config
            </button>
        </div>
    );
};

export default Footbar;
