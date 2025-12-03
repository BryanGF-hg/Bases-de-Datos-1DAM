-- Creamos la base de datos
CREATE DATABASE paises;
USE paises;

-- Creamos la tabla
CREATE TABLE paises (
    id INT AUTO_INCREMENT PRIMARY KEY,
    pais VARCHAR(100) NOT NULL,
    ciudad VARCHAR(100) NOT NULL,
    idioma VARCHAR(100) NOT NULL,
    moneda VARCHAR(100) NOT NULL
);

-- Insertamos registros
INSERT INTO paises (pais, ciudad, idioma, moneda) VALUES
('España', 'Madrid', 'Español', 'Euro'),
('Francia', 'París', 'Francés', 'Euro'),
('Alemania', 'Berlín', 'Alemán', 'Euro'),
('Italia', 'Roma', 'Italiano', 'Euro'),
('Portugal', 'Lisboa', 'Portugués', 'Euro'),
('México', 'Ciudad de México', 'Español', 'Peso mexicano'),
('Argentina', 'Buenos Aires', 'Español', 'Peso argentino'),
('Brasil', 'Brasilia', 'Portugués', 'Real brasileño'),
('Japón', 'Tokio', 'Japonés', 'Yen'),
('China', 'Pekín', 'Chino mandarín', 'Yuan');

