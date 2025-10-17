--create
INSERT INTO clientes VALUES(
 NULL,
 'Bryan',
 'Glot Fong',
 'info@gmail.com'
);

--read
SELECT * FROM clientes;

--update
UPDATE clientes
SET email = 'nuevainfo@gmail.com'
WHERE Identificador = 1;

--delete
DELETE FROM clientes
WHERE Identificador = 1;
