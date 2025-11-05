1.-Introducción:
Debemos crear una base de datos que contenga dos tablas y que muestren una petición cruzada y la vista pública de esa petición. Más adelante, lo conectaremos con Python

-- Para iniciar en el MySQL--
sudo mysql -u root -p

--Creamos base de datos para el simulacro--
CREATE DATABASE portafolio_simulacro;

--Mostramos que se ha creado la base de datos--
SHOW DATABASES;

--Creamos la primera tabla llamada Pieza que contiene--
--Identificador PK, titulo, descripcion, imagen, url, id_categoria FK--
CREATE TABLE Pieza (
  Identificador INT AUTO_INCREMENT PRIMARY KEY,
  titulop VARCHAR(50),
  descripcionp VARCHAR(255),
  imagen VARCHAR(255),
  url VARCHAR(100),
  id_categoria INT,
  FOREIGN KEY (id_categoria) REFERENCES Categoria(Identificador)
);

--Creamos la segunda tabla llamada Categoria que contiene--
--Identificador PK, titulo, descripcion--

CREATE TABLE Categoria (
 Identificador INT AUTO_INCREMENT PRIMARY KEY,
 tituloc VARCHAR(255),
 descripcionc VARCHAR(255)
);

--Mostramos si las tablas han sido creadas--
SHOW TABLES;

--Introducimos datos a las tablas--
INSERT INTO Pieza VALUES(
 NULL,
 'Pieza de Lego Dorada',
 'Una pieza de lego de color dorado',
 'imagen.png',
 'lego.com/pieza-dorada',
 NULL
);

INSERT INTO Categoria VALUES(
 NULL,
 'Piezas de Construcción',
 'Piezas usadas por niños'
);

--Hacemos una petición cruzada entre las dos tablas --
SELECT Pieza.titulop,Pieza.descripcionp,Pieza.imagen,Pieza.url,Pieza.id_categoria,Categoria.tituloc,Categoria.descripcionc
FROM Pieza
LEFT JOIN Categoria
ON Pieza.id_categoria = Categoria.Identificador;

--Mostramos el resultado de la petición cruzada--
+----------------------+-----------------------------------+------------+-----------------------+--------------+---------+--------------+
| titulop              | descripcionp                      | imagen     | url                   | id_categoria | tituloc | descripcionc |
+----------------------+-----------------------------------+------------+-----------------------+--------------+---------+--------------+
| Pieza de Lego Dorada | Una pieza de lego de color dorado | imagen.png | lego.com/pieza-dorada |         NULL | NULL    | NULL         |
+----------------------+-----------------------------------+------------+-----------------------+--------------+---------+--------------+
1 row in set (0,00 sec)



--Creamos una vista de la petición cruzada (JOIN) --

CREATE VIEW vista_piezacategoria AS SELECT Pieza.titulop,Pieza.descripcionp,Pieza.imagen,Pieza.url,Pieza.id_categoria,Categoria.tituloc,Categoria.descripcionc
FROM Pieza LEFT JOIN Categoria ON Pieza.id_categoria = Categoria.Identificador;

--Vemos la vista creada--
SELECT*FROM vista_piezacategoria;
SELECT*FROM vista_portafolio;

+----------------------+-----------------------------------+------------+-----------------------+--------------+---------+--------------+
| titulop              | descripcionp                      | imagen     | url                   | id_categoria | tituloc | descripcionc |
+----------------------+-----------------------------------+------------+-----------------------+--------------+---------+--------------+
| Pieza de Lego Dorada | Una pieza de lego de color dorado | imagen.png | lego.com/pieza-dorada |         NULL | NULL    | NULL         |
+----------------------+-----------------------------------+------------+-----------------------+--------------+---------+--------------+
1 row in set (0,00 sec)






-------------------------------------------------
--PARA USAR EL PROGRAMA EN PYTHON MÁS ADELANTE:--
-------------------------------------------------

-- crea usuario nuevo con contraseña
CREATE USER 
'Admin'@'localhost' 
IDENTIFIED  BY 'Contrasena123$';

-- permite acceso a ese usuario a la base de datos
GRANT USAGE ON *.* TO 'Admin'@'localhost';
-- quitale todos los limites que tenga
ALTER USER 'Admin'@'localhost' 
REQUIRE NONE 
WITH MAX_QUERIES_PER_HOUR 0 
MAX_CONNECTIONS_PER_HOUR 0 
MAX_UPDATES_PER_HOUR 0 
MAX_USER_CONNECTIONS 0;

-- dale acceso a la base de datos portafolio_simulacro
GRANT ALL PRIVILEGES ON `portafolio_simulacro`.* 
TO 'Admin'@'localhost';
-- recarga la tabla de privilegios
FLUSH PRIVILEGES;

--Mostramos los privilegios de Admin, nuestro usuario --
SHOW GRANTS FOR 'Admin'@'localhost';


    
