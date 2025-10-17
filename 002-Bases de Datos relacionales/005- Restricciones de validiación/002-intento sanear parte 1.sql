ALTER TABLE clientes
 ADD CONSTRAINT comprobar_email
 CHECK (email REGEXP '^[A-Za-z0-9.%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$');
 
 
 
--eliminamos registros que no cumplen
DELETE FROM clientes WHERE identificador = 4;

DELETE FROM clientes WHERE identificador = 4; --en otro caso

--Ahora sí, aplicamos
ALTER TABLE clientes
 ADD CONSTRAINT comprobar_email
 CHECK (email REGEXP '^[A-Za-z0-9.%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$');
 
 
 
INSERT INTO clientes
VALUES(
  NULL,
  '12345678A',
  'Nombre',
  'Apellido1 Apellido2',
  'algo'
);

ERROR 3819 (HY000): Check constraint 'comprobar_email' is violated.

