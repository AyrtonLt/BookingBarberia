import React, { useState } from 'react';
import './App.css';
import Register from './components/Register';
import Usuario from './components/Usuario';

const App = () => {
    const [email, setEmail] = useState('');
    const [password, setPassword] = useState('');
    const [isRegistering, setIsRegistering] = useState(false);
    const [isLoggedIn, setIsLoggedIn] = useState(false);

    const handleLogin = () => {
        // Agrega aquí la lógica para el inicio de sesión

        // Supongamos que el inicio de sesión fue exitoso
        setIsLoggedIn(true);
    };

    const handleToggleRegister = () => {
        setIsRegistering(!isRegistering);
    };

    return (
        <div className="App">
            <h1>Booking de Barbería</h1>
            {!isLoggedIn ? (
                <div>
                    {isRegistering ? (
                        <Register />
                    ) : (
                        <div>
                            <img src="images/barberohome.jpg" alt="Barbero" />
                            <form onSubmit={handleLogin}>
                                <input
                                    type="email"
                                    placeholder="Correo electrónico"
                                    value={email}
                                    onChange={(e) => setEmail(e.target.value)}
                                />
                                <input
                                    type="password"
                                    placeholder="Contraseña"
                                    value={password}
                                    onChange={(e) => setPassword(e.target.value)}
                                />
                                <button type="submit">Iniciar sesión</button>
                            </form>
                        </div>
                    )}
                    <button onClick={handleToggleRegister}>
                        {isRegistering ? 'Volver al inicio de sesión' : 'Registrarse'}
                    </button>
                </div>
            ) : (
                <Usuario />
            )}
        </div>
    );
};

export default App;


