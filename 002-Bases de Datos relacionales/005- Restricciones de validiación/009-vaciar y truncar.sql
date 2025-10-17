DELETE FROM clientes; -- borra todo

INSERT INTO clientes
VALUES(
  NULL,
  '12345678A',
  'Nombre',
  'Apellido1 Apellido2',
  'info@gmail.com'
);

SELECT * FROM clientes;

TRUNCATE TABLE clientes; -- resetea la tabla pero no se carga

INSERT INTO clientes
VALUES(
  NULL,
  '12345678A',
  'Nombre',
  'Apellido1 Apellido2',
  'info@gmail.com'
);

SELECT * FROM clientes;

DROP TABLE clientes; -- mucho cuidado con esto porque borra la tabla
