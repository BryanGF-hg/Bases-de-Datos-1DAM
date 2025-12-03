CREATE TABLE cliente (
  id INT PRIMARY KEY,
  nombre VARCHAR(255),
  apellidos VARCHAR(255),
  email VARCHAR(255)
);

CREATE TABLE producto (
  id INT PRIMARY KEY,
  nombre VARCHAR(255)
);

CREATE TABLE pedido (
  id INT PRIMARY KEY,
  cliente_id INT,
  fecha VARCHAR(255),
  CONSTRAINT fk_pedido_1 FOREIGN KEY (cliente_id) REFERENCES cliente(id)
);

CREATE TABLE lineapedido (
  id INT PRIMARY KEY,
  pedido_id INT,
  producto_id INT,
  cantidad VARCHAR(255),
  CONSTRAINT fk_lineapedido_1 FOREIGN KEY (producto_id) REFERENCES producto(id),
  CONSTRAINT fk_lineapedido_2 FOREIGN KEY (pedido_id) REFERENCES pedido(id)
);