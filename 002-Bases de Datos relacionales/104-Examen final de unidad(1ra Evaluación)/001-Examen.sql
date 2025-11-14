1.-Introducción:
Debemos crear una base de datos, portafolioexamen, que contenga dos tablas donde contenga claves primarias y una clave foranea. Además de tener una petición cruzada, una vista que nos permite ver esta petición cruzada y un usuario con todos los privilegios para acceder a la base de datos.

2.-Desarrollo:
Accedemos a MySQL con nuestro usuario:
```
sudo mysql -u root -p
```

Creamos una base de datos a usar:
```
CREATE DATABASE portafolioexamen;
```

Mostramos que existe la base de datos:
```
SHOW DATABASES;
```

Usamos la base de datos:
```
USE portafolioexamen;
```

Creamos la tabla piezasportafolio con las siguientes columnas: Identificador, titulo, descripcion, fecha y id_categoria:
```
CREATE TABLE piezasportafolio (
 Identificador INT AUTO_INCREMENT PRIMARY KEY,
 titulo VARCHAR(255),
 descripcion VARCHAR(255),
 fecha VARCHAR(255),
 id_categoria INT
);
```

Creamos la tabla categoriasportafolio con las siguientes columnas: Identificador, nombre:
```
CREATE TABLE categoriasportafolio (
 Identificador INT AUTO_INCREMENT PRIMARY KEY,
 nombre VARCHAR(255)
);
```

Creamos una clave foránea que nos relacione las dos tablas:
```
ALTER TABLE piezasportafolio
ADD CONSTRAINT fk_piezas_x_categoria
FOREIGN KEY (id_categoria) REFERENCES categoriasportafolio(Identificador);
```

Empezamos el método crud, insertando registros a las dos tablas:
```
INSERT INTO categoriasportafolio VALUES (
 NULL,
 "Primera Categoria del portafolio"
);

INSERT INTO piezasportafolio VALUES (
 NULL,
 "Primera pieza",
 "Descripción de la primera pieza",
 "9 de Noviembre de 2025",
 NULL
);
```

Ahora, leemos los datos ingresados a ambas tablas y enseñamos lo que hay en pantalla:
```
SELECT*FROM piezasportafolio;

+---------------+---------------------+----------------------------------+------------------------+--------------+
| Identificador | titulo              | descripcion                      | fecha                  | id_categoria |
+---------------+---------------------+----------------------------------+------------------------+--------------+
|             3 | Nuevo primer titulo | Descripción de la primera pieza  | 9 de Noviembre de 2025 |         NULL |
+---------------+---------------------+----------------------------------+------------------------+--------------+

SELECT*FROM categoriasportafolio;

+---------------+-------------------+
| Identificador | nombre            |
+---------------+-------------------+
|             1 | Primera Categoria |
+---------------+-------------------+
```

Actualizamos los datos de las tablas usando sus identificadores(La tabla piezasportafolio tiene un Identificador 3 que contiene los valores registrados, por alguna razon, los Identificador 1 y 2 no tienen valores, otra cosa para otro día):
```
UPDATE piezasportafolio
SET titulo = "Nuevo primer titulo"
WHERE Identificador = 3;

UPDATE categoriasportafolio
SET nombre = "Primera Categoria"
WHERE Identificador = 1;
```

Por último, eliminamos los registros usando sus identificadores: 
```
DELETE FROM  piezasportafolio
WHERE Identificador = 3;

DELETE FROM  categoriasportafolio
WHERE Identificador = 1;
```

Hacemos una petición cruzada entre las dos tablas usando sus identificadores:
```
SELECT*FROM piezasportafolio
LEFT JOIN categoriasportafolio
ON piezasportafolio.id_categoria = categoriasportafolio.Identificador;

+---------------+---------------+----------------------------------+------------------------+--------------+---------------+--------+
| Identificador | titulo        | descripcion                      | fecha                  | id_categoria | Identificador | nombre |
+---------------+---------------+----------------------------------+------------------------+--------------+---------------+--------+
|             4 | Primera pieza | Descripción de la primera pieza  | 9 de Noviembre de 2025 |         NULL |          NULL | NULL   |
+---------------+---------------+----------------------------------+------------------------+--------------+---------------+--------+
```

Creamos una vista de las dos tablas usando la Petición Cruzada:
```
CREATE VIEW piezas_categorias AS
SELECT
piezasportafolio.titulo,
piezasportafolio.descripcion,
piezasportafolio.fecha,
categoriasportafolio.nombre
 FROM piezasportafolio
LEFT JOIN categoriasportafolio
ON piezasportafolio.id_categoria = categoriasportafolio.Identificador;
```

Mostramos las propiedades de la vista:
```
SELECT*FROM piezas_categorias;

+---------------+----------------------------------+------------------------+--------+
| titulo        | descripcion                      | fecha                  | nombre |
+---------------+----------------------------------+------------------------+--------+
| Primera pieza | Descripción de la primera pieza  | 9 de Noviembre de 2025 | NULL   |
+---------------+----------------------------------+------------------------+--------+
```

Creamos un usuario:
```
CREATE USER
'Usuario-portafolio'@'localhost'
IDENTIFIED BY 'Contrasena123$';
```

Le permitimos el acceso mínimo al usuario a MySQL:
```
GRANT USAGE ON *.* TO 'Usuario-portafolio'@'localhost';
```

Le damos permisos al usuario tanto a nivel único como a nivel de base de datos:
```
ALTER USER 'Usuario-portafolio'@'localhost'
REQUIRE NONE 
WITH MAX_QUERIES_PER_HOUR 0 
MAX_CONNECTIONS_PER_HOUR 0 
MAX_UPDATES_PER_HOUR 0 
MAX_USER_CONNECTIONS 0;

```

Le damos todos los privilegios a portafolioexamen, la base de datos:
```
GRANT ALL PRIVILEGES ON `portafolioexamen`.* 
TO 'Usuario-portafolio'@'localhost';
```

Recargamos los privilegios
```
FLUSH PRIVILEGES;
```

Seleccionamos el usuario para comprobar que existe:
```
SELECT User, Host FROM mysql.user;
  
SELECT * FROM mysql.user;
```




3.-Aplicación:
Podemos aplicar la construcción de una base de datos con tablas y clave primarias y clave foraneas para relacionar toda la información en sí y mostrar los datos de una manera resumida usando vista de peticiones cruzadas en vez de buscar en diferentes tablas. Algunos ámbitos donde se puede usar son: marketing y publicidad, programas de control de datos en escuelas, empresas, sitios web, etc.

4.-Conclusión:
Al crear una base de datos que contenga tablas con clave primarias, clave foráneas, peticiones cruzadas y vistas nos permite mostrar la información de manera concentrada en vez de condensada y saturada en diferentes tablas. Esto será una herramienta muy útil al manejar base de datos que contenga muchas tablas, clave primarias que las identifiquen o clave foráneas que las relaciones, porque al usar vistas cruzadas nos permite ver esa información de manera, concentrada.


Código:
```
sudo mysql -u root -p

CREATE DATABASE portafolioexamen;

SHOW DATABASES;

USE portafolioexamen;

CREATE TABLE piezasportafolio (
 Identificador INT AUTO_INCREMENT PRIMARY KEY,
 titulo VARCHAR(255),
 descripcion VARCHAR(255),
 fecha VARCHAR(255),
 id_categoria INT
);

CREATE TABLE categoriasportafolio (
 Identificador INT AUTO_INCREMENT PRIMARY KEY,
 nombre VARCHAR(255)
);

--Clave Foránea--
ALTER TABLE piezasportafolio
ADD CONSTRAINT fk_piezas_x_categoria
FOREIGN KEY (id_categoria) REFERENCES categoriasportafolio(Identificador);

--------------------------------
--MÉTODO CRUD----
--------------------------------

--INSERTAR--
INSERT INTO categoriasportafolio VALUES (
 NULL,
 "Primera Categoria del portafolio"
);

INSERT INTO piezasportafolio VALUES (
 NULL,
 "Primera pieza",
 "Descripción de la primera pieza",
 "9 de Noviembre de 2025",
 NULL
);

--LEER--
SELECT*FROM piezasportafolio;

+---------------+---------------------+----------------------------------+------------------------+--------------+
| Identificador | titulo              | descripcion                      | fecha                  | id_categoria |
+---------------+---------------------+----------------------------------+------------------------+--------------+
|             3 | Nuevo primer titulo | Descripción de la primera pieza  | 9 de Noviembre de 2025 |         NULL |
+---------------+---------------------+----------------------------------+------------------------+--------------+


SELECT*FROM categoriasportafolio;

+---------------+-------------------+
| Identificador | nombre            |
+---------------+-------------------+
|             1 | Primera Categoria |
+---------------+-------------------+


--ACTUALIZAR--
UPDATE piezasportafolio
SET titulo = "Nuevo primer titulo"
WHERE Identificador = 3;

UPDATE categoriasportafolio
SET nombre = "Primera Categoria"
WHERE Identificador = 1;

--ELIMINAR--
DELETE FROM  piezasportafolio
WHERE Identificador = 3;

DELETE FROM  categoriasportafolio
WHERE Identificador = 1;

--Petición Cruzada--
SELECT*FROM piezasportafolio
LEFT JOIN categoriasportafolio
ON piezasportafolio.id_categoria = categoriasportafolio.Identificador;

+---------------+---------------+----------------------------------+------------------------+--------------+---------------+--------+
| Identificador | titulo        | descripcion                      | fecha                  | id_categoria | Identificador | nombre |
+---------------+---------------+----------------------------------+------------------------+--------------+---------------+--------+
|             4 | Primera pieza | Descripción de la primera pieza  | 9 de Noviembre de 2025 |         NULL |          NULL | NULL   |
+---------------+---------------+----------------------------------+------------------------+--------------+---------------+--------+

--Vista usando la Petición Cruzada--
CREATE VIEW piezas_categorias AS
SELECT
piezasportafolio.titulo,
piezasportafolio.descripcion,
piezasportafolio.fecha,
categoriasportafolio.nombre
 FROM piezasportafolio
LEFT JOIN categoriasportafolio
ON piezasportafolio.id_categoria = categoriasportafolio.Identificador;

SELECT*FROM piezas_categorias;

+---------------+----------------------------------+------------------------+--------+
| titulo        | descripcion                      | fecha                  | nombre |
+---------------+----------------------------------+------------------------+--------+
| Primera pieza | Descripción de la primera pieza  | 9 de Noviembre de 2025 | NULL   |
+---------------+----------------------------------+------------------------+--------+



--Usuario con permiso a portafolioexamen--

CREATE USER
'Usuario-portafolio'@'localhost'
IDENTIFIED BY 'Contrasena123$';

GRANT USAGE ON *.* TO 'Usuario-portafolio'@'localhost';

ALTER USER 'Usuario-portafolio'@'localhost'
REQUIRE NONE 
WITH MAX_QUERIES_PER_HOUR 0 
MAX_CONNECTIONS_PER_HOUR 0 
MAX_UPDATES_PER_HOUR 0 
MAX_USER_CONNECTIONS 0;

GRANT ALL PRIVILEGES ON `portafolioexamen`.* 
TO 'Usuario-portafolio'@'localhost';

FLUSH PRIVILEGES;

SELECT User, Host FROM mysql.user;
  
SELECT * FROM mysql.user;
```
