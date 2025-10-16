------------------------------------------------------------------------------------------------------------------
-----------------------------------------------MY SQL FUNDAMENTALIS v0.3 por Bryan Glot Fong- 1 DAM --------------
-----------------------------------------------(puede conllevar errores)------------------------------------------
-----------------------------------------------(el humano tiene la opción prioritaria)----------------------------
-----------------------------------------------(de cambiarlo)-----------------------------------------------------
------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------

En terminal:
Para Copiar => Ctrl + Mayusculas + C

-- Para iniciar en el MySQL--
sudo mysql -u root -p
-- Para iniciar de MySQL--
quit;


SHOW DATABASES;
SHOW TABLES;

------------------
-- Create DATABASE--
------------------

CREATE DATABASE empresadam;

---------------
--Create TABLE--
---------------

CREATE TABLE clientes (
  dni VARCHAR(9),
  nombres VARCHAR(50),
  apellidos VARCHAR(255),
  email VARCHAR(100)
);

CREATE TABLE productos (
  nombre varchar(255),
  descripcion text,
  precio decimal(5,2),
  stock int
);


------------------------------------
-- PARA CREAR COPIA DE SEGURIDAD--
------------------------------------
sudo mysqldump -u root -p empresadam > copiadeseguridad.sql


------------
-- INSERT (puede variar)--
------------

INSERT INTO clientes
VALUES(
  NULL,
  '12345678A',
  'Nombre',
  'Apellido1 Apellido2',
  'info@gmail.com'
);

------------
-- Select --
------------
SELECT * FROM clientes;

--------------
-- Describe --
--------------
DESCRIBE Clientes;

-----------------
-- PARA AÑADIR COLUMNA--
-----------------
ALTER TABLE clientes
ADD COLUMN direccion VARCHAR(255);

-----------------
-- PARA ELIMINAR COLUMNA --
-----------------
ALTER TABLE clientes
DROP COLUMN direccion;

----------------------------------
   -- PARA REINICIAR TABLA --
----------------------------------
TRUNCATE TABLE clientes; -- resetea la tabla pero no se carga

---------------------------------------------------
Para alterar clientes y añadir una clave primaria
---------------------------------------------------
ALTER TABLE clientes
ADD COLUMN identificador INT AUTO_INCREMENT PRIMARY KEY FIRST;

---------------------------------------------------
MUCHO CUIDADOMUCHO CUIDADOMUCHO CUIDADOMUCHO CUIDADO
---------------------------------------------------
DELETE FROM clientes; -- eliminar datos de la tabla

DROP TABLE clientes; -- mucho cuidado con esto porque borra la tabla

------------------------------------------------------------------------------------------------------------
Para añadir restricciones (en este caso para el email)
------------------------------------------------------------------------------------------------------------
ALTER TABLE clientes
 ADD CONSTRAINT comprobar_email
 CHECK (email REGEXP '^[A-Za-z0-9.%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$');

------------------------------------------------------------------------------------------------------------
Para añadir restricciones (en este caso para el DNI/NIE que tienen letra)
------------------------------------------------------------------------------------------------------------
ALTER TABLE clientes
  ADD CONSTRAINT comprobar_dni_nie_letra
  CHECK (
    (
      -- DNI: 8 dígitos + letra
      dni REGEXP '^[0-9]{8}[A-Za-z]$'
      AND
      UPPER(SUBSTRING(dni, 9, 1)) =
      SUBSTRING('TRWAGMYFPDXBNJZSQVHLCKE',
                (CAST(SUBSTRING(dni, 1, 8) AS UNSIGNED) MOD 23) + 1,
                1)
    )
    OR
    (
      -- NIE: X/Y/Z + 7 dígitos + letra
      dni REGEXP '^[XYZxyz][0-9]{7}[A-Za-z]$'
      AND
      UPPER(SUBSTRING(dni, 9, 1)) =
      SUBSTRING('TRWAGMYFPDXBNJZSQVHLCKE',
                (
                  CAST(CONCAT(
                        CASE UPPER(SUBSTRING(dni, 1, 1))
                          WHEN 'X' THEN '0'
                          WHEN 'Y' THEN '1'
                          WHEN 'Z' THEN '2'
                        END,
                        SUBSTRING(dni, 2, 7)
                  ) AS UNSIGNED) MOD 23
                ) + 1,
                1)
    )
  );



