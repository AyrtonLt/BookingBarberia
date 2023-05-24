import React, { useState } from 'react';

const Register = () => {
    const [email, setEmail] = useState('');
    const [password, setPassword] = useState('');
    const [confirmPassword, setConfirmPassword] = useState('');

    const handleRegister = () => {
        // Verificar que las contraseñas coincidan
        if (password !== confirmPassword) {
            alert('Las contraseñas no coinciden');
            return;
        }

        // Agregar aquí la lógica para el registro de usuario
    };

    const handleRegisterFacebook = () => {
        // Agregar aquí la lógica para el registro mediante Facebook
    };

    const handleRegisterGoogle = () => {
        // Agregar aquí la lógica para el registro mediante Google
    };

    return (
        <div>
            <h2>Registro de Usuario</h2>
            <form onSubmit={handleRegister}>
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
                <input
                    type="password"
                    placeholder="Confirmar Contraseña"
                    value={confirmPassword}
                    onChange={(e) => setConfirmPassword(e.target.value)}
                />
                <button type="submit">Registrarse</button>
            </form>
            <div>
                <button onClick={handleRegisterFacebook}>Registrarse con Facebook</button>
                <button onClick={handleRegisterGoogle}>Registrarse con Google</button>
            </div>
        </div>
    );
};

export default Register;

