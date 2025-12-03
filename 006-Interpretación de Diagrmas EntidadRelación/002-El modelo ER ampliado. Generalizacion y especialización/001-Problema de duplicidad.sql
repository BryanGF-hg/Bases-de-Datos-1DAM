CREATE TABLE profesor (
  id INT PRIMARY KEY,
  nombre VARCHAR(255),
  apellidos VARCHAR(255),
  email VARCHAR(255)
);

CREATE TABLE alumno (
  id INT PRIMARY KEY,
  nombre VARCHAR(255),
  apellidos VARCHAR(255),
  email VARCHAR(255)
);

CREATE TABLE lineapedido (
  id INT PRIMARY KEY,
  pedido_id INT,
  producto_id INT
);