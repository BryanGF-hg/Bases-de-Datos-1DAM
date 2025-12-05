CREATE DATABASE IF NOT EXISTS superaplicacion
    CHARACTER SET utf8mb4
    COLLATE utf8mb4_unicode_ci;

USE superaplicacion;

CREATE TABLE IF NOT EXISTS usuarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    usuario VARCHAR(50) NOT NULL UNIQUE,
    contrasena VARCHAR(255) NOT NULL,
    nombrecompleto VARCHAR(150) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    creado_en TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO usuarios (usuario, contrasena, nombrecompleto, email)
VALUES
('jlopez', '1234segura', 'Juan López Martínez', 'juan.lopez@example.com'),

('mgarcia', 'clave2025', 'María García Sánchez', 'maria.garcia@example.com'),

('pcarrasco', 'passPrueba!', 'Pedro Carrasco Hernández', 'pedro.carrasco@example.com'),

('alorenzo', 'contrasenaXYZ', 'Ana Lorenzo Ruiz', 'ana.lorenzo@example.com'),

('rfernandez', 'miClaveSegura', 'Raúl Fernández Ortega', 'raul.fernandez@example.com');
