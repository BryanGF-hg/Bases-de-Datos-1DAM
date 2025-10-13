ALTER TABLE clientes
ADD COLUMN identificador INT AUTO_INCREMENT PRIMARY KEY FIRST;

ALTER = Altera
TABLE = Tabla
clientes = la tabla a alterar
ADD = la operacion a realizar
COLUMN = quiero añadir una columna
identificador = es el nombre de la columna que quiero añadir
INT = el tipo de dato de la columna (entero)
AUTO_INCREMENT = el numero va a crecer automaticamente
PRIMARY KEY = clave primaria
FIRST = si hay varias, esta tiene la preferencia

DESCRIBE Clientes;

INSERT INTO clientes
VALUES(
  NULL,
  '12345678A',
  'Bryan',
  'Glot Fong',
  'info@gmail.com'
);

SELECT * FROM clientes;
