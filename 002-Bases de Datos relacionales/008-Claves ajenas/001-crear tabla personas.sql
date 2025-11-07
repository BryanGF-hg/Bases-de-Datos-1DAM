sudo mysql -u root -p

CREATE DATABASE ejemploclaves;

USE ejemploclaves;

-- crear tabla personas
CREATE TABLE personas (
  nombre varchar(255),
  apellidos varchar(255)
);

-- añado identificador

ALTER TABLE personas
ADD COLUMN identificador INT AUTO_INCREMENT PRIMARY KEY FIRST;

