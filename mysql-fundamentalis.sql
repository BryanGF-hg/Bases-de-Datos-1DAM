------------------------------------------------------------------------------------------------------------------
-----------------------------------------------MY SQL FUNDAMENTALIS v0.3 por Bryan Glot Fong- 1 DAM --------------
-----------------------------------------------(puede conllevar errores)------------------------------------------
-----------------------------------------------(el humano tiene la opción prioritaria)----------------------------
-----------------------------------------------(de cambiarlo)-----------------------------------------------------
------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------


Siempre recordar cerrar las comas, llaves, y entre cosas (te veo archivo.close())
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

CREATE DATABASE basededatos;

---------------
--Create TABLE--
---------------

CREATE TABLE clientes (
  dni VARCHAR(9),
  nombres VARCHAR(50),
  apellidos VARCHAR(255),
  email VARCHAR(100),
  PRIMARY KEY("Identificador" AUTOINCREMENT)
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

--------------------------------------------------------
-- Describe(Muestra las propiedades de clientes) --
--------------------------------------------------------
DESCRIBE Clientes;

-----------------
-- PARA AÑADIR COLUMNA--
-----------------
ALTER TABLE tabla
ADD COLUMN columna VARCHAR(255);

-----------------
-- PARA ELIMINAR COLUMNA --
-----------------
ALTER TABLE tabla
DROP COLUMN columna;

----------------------------------
   -- PARA REINICIAR TABLA --
----------------------------------
TRUNCATE TABLE tabla; -- resetea la tabla pero no se carga

---------------------------------------------------
Para alterar clientes y añadir una clave primaria
---------------------------------------------------
ALTER TABLE tabla
ADD COLUMN identificador INT AUTO_INCREMENT PRIMARY KEY FIRST;

---------------------------------------------------
Para añadir una clave ajena ("foreign key"/fk)
---------------------------------------------------

ALTER TABLE email                                       --Altera la tabla de email
ADD CONSTRAINT fk_emails_personas                        --Crea una restricción con este nombre
FOREIGN KEY (persona)                                    --Creamos una clave hacia persona
REFERENCES personas(identificador)                       --que referencia el identificador 
ON DELETE CASCADE                                        --Cuando elimines, cascada
ON UPDATE CASCADE;                                       --Cuando actualices, cascada
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


------------------------------------------------------------------------------------------------------------
Para crear un usuario
------------------------------------------------------------------------------------------------------------

-- crea usuario nuevo con contraseña
-- creamos el nombre de usuario que queramos
CREATE USER 
'[tunombredeusuario]'@'[localhost]' 
IDENTIFIED  BY '[tucontraseña]';

-- permite acceso a ese usuario
GRANT USAGE ON *.* TO '[tunombredeusuario]'@'[tuservidor]';
--[tuservidor] == localhost
-- La contraseña puede requerir Mayus, minus, carácteres especiales,etc

-- quitale todos los limites que tenga
ALTER USER '[tunombredeusuario]'@'[tuservidor]' 
REQUIRE NONE 
WITH MAX_QUERIES_PER_HOUR 0 
MAX_CONNECTIONS_PER_HOUR 0 
MAX_UPDATES_PER_HOUR 0 
MAX_USER_CONNECTIONS 0;

-- dale acceso a la base de datos
GRANT ALL PRIVILEGES ON `[tubasededatos]`.* 
TO '[tunombredeusuario]'@'[tuservidor]';

-- recarga la tabla de privilegios
FLUSH PRIVILEGES;




------------------------------------------------------------------------------------------------------------------
-C                          R                          U                      D 

----------------------------------------------------------------------------------------------------------------
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


------------------------------------------------------------------------------------------------------------------

                        p             y             t             h           o           n
                                                          +
                                            s             q           l
                        
------------------------------------------------------------------------------------------------------------------
-DOC IMPORTANTE:
------------------------------
- TRES COMILLAS DOBLES DE PYTHON
- COMILLAS SIMPLES DE SQL
------------------------------

cursor.execute("""
 INSERT INTO clientes VALUES(
   NULL,'"""+nombre+"""','"""+apellidos+"""','"""+email+"""'
 );
""")



