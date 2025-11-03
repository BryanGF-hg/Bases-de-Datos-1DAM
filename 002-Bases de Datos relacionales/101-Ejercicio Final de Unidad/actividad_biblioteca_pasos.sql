1.-Introducción:
Debemos crear una base de datos llamada biblioteca25 con 3 tablas(autores,libros y prestamos) para que, por ejemplo, una libreria pueda usarla para registrar sus datos. También debemos tener en cuenta restricciones (CHECK), claves ajenas es decir relaciones entre diferentes tablas (CASCADE), índices para poder organizar la información de forma esquemática.

2.-Desarrollo:

Se crea la base de datos biblioteca25 y se selecciona como contexto activo para las operaciones posteriores:
```
##PASO 1:

CREATE DATABASE biblioteca25;
USE biblioteca25;

**Evidencia:**

SELECT DATABASE();
+--------------+
| DATABASE()   |
+--------------+
| biblioteca25 |
+--------------+
```

Para la siguiente tabla, autores, tiene una estructura con datos de id que es una Clave primaria autoincremental, nombres que es un Nombre completo del autor, pais que es el País de origen.
```
##PASO 2:
---TABLA AUTORES-------
CREATE TABLE autores (
nombres VARCHAR(100),
pais VARCHAR(80)
);

ALTER TABLE autores
ADD COLUMN id INT AUTO_INCREMENT PRIMARY KEY FIRST;

DESCRIBE autores;

**Verificación:**

+---------+--------------+------+-----+---------+----------------+
| Field | Type | Null | Key | Default | Extra |
+---------+--------------+------+-----+---------+----------------+
| id | int | NO | PRI | NULL | auto_increment |
| nombres | varchar(100) | YES | | NULL | |
| pais | varchar(80) | YES | | NULL | |
+---------+--------------+------+-----+---------+----------------+
3 rows in set (0,00 sec)
```


Ahora creamos una tabla llamada libros con una estructura compuesta por datos de id que es una Clave primaria autoincremental, titulo como el título de un libro, isbn para el Código ISBN, precio para el Precio del libro(que no puede ser negativo), autor_id que es una clave foránea que referencia a autores(id).

```
#PASO 3:

---TABLA LIBROS---
CREATE TABLE libros (
titulo VARCHAR(200) NOT NULL,
isbn VARCHAR(20) NOT NULL,
precio DECIMAL(8,2) NOT NULL,
autor_id INT NOT NULL
);

--- Clave primaria para id---
---Rasgo de precio----
ALTER TABLE libros
ADD COLUMN id INT AUTO_INCREMENT PRIMARY KEY FIRST;
```

También creamos un índice para el título que ayuda a mejorar búsquedas por nombre:
```
CREATE INDEX titulo_index ON libros(titulo);
```

Hay que mostrar la verificación de la tabla usando los siguientes comandos:
```
SHOW INDEX FROM libros;

INSERT INTO libros VALUES(
1,
'Titulo del Libro',
'12345678910111213',
'-5.3',
1
);
```

También añadimos evidencia de los comandos y sus resultados que aparezcen en la terminal:
```
DESCRIBE libros;
+----------+--------------+------+-----+---------+----------------+
| Field | Type | Null | Key | Default | Extra |
+----------+--------------+------+-----+---------+----------------+
| id | int | NO | PRI | NULL | auto_increment |
| titulo | varchar(200) | YES | MUL | NULL | |
| isbn | varchar(20) | YES | | NULL | |
| precio | decimal(8,2) | YES | | NULL | |
| autor_id | int | NO | MUL | NULL | |
+----------+--------------+------+-----+---------+----------------+
5 rows in set (0,00 sec)


SHOW INDEX FROM libros;

+--------+------------+--------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| Table | Non_unique | Key_name | Seq_in_index | Column_name | Collation | Cardinality | Sub_part | Packed | Null | Index_type | Comment | Index_comment | Visible | Expression |
+--------+------------+--------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| libros | 0 | PRIMARY | 1 | id | A | 0 | NULL | NULL | | BTREE | | | YES | NULL |
| libros | 1 | fk_autor_id | 1 | autor_id | A | 0 | NULL | NULL | | BTREE | | | YES | NULL |
| libros | 1 | titulo_index | 1 | titulo | A | 0 | NULL | NULL | YES | BTREE | | | YES | NULL |
+--------+------------+--------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
3 rows in set (0,00 sec)


* (Si probaste el fallo) el mensaje de error del `CHECK`.

ERROR 3819 (HY000): Check constraint 'libros_chk_1' is violated.
```

Creamos validaciones como la restricción CHECK para que el precio sea positivo y una clave foránea con ON DELETE RESTRICT y ON UPDATE CASCADE:
```
ALTER TABLE libros ADD CHECK (precio >= 0);

---Clave foranea--------
---ON DELETE RESTRICT---
---ON UPDATE CASCADE;---
ALTER TABLE libros
ADD CONSTRAINT fk_autor_id
FOREIGN KEY (autor_id) REFERENCES autores(id)
ON DELETE RESTRICT
ON UPDATE CASCADE;
```

Ahora creamos una tabla prestamos que tiene los siguientes datos, id para que sea una Clave primaria autoincremental, socio_id como Identificador del socio(que no será usado en este ejercio), libro_id como referrencia al libro prestado, fecha_prestamos como fecha del préstamo que es por defecto el día actual, fecha_devolcion como fecha de devolución que puede ser nula.
```
##PASO 5:

CREATE TABLE prestamos (
 id INT AUTO_INCREMENT PRIMARY KEY,
 socio_id INT NOT NULL,
 libro_id INT NOT NULL,
 fecha_prestamos DATE NOT NULL DEFAULT(CURRENT_DATE),
 fecha_devolucion DATE NULL
);

ALTER TABLE prestamos
ADD CONSTRAINT fk_socio
FOREIGN KEY (socio_id) REFERENCES prestamos(id)
ON UPDATE CASCADE
ON DELETE CASCADE;

ALTER TABLE prestamos
ADD CONSTRAINT fk_libro
FOREIGN KEY (libro_id) REFERENCES prestamos(id) 
ON UPDATE CASCADE
ON DELETE RESTRICT;
```

También hay que usar una validación CHECK para asegurar que la fecha de devolución no sea anterior a la fecha de prestamo:
```
ALTER TABLE prestamos ADD CHECK (fecha_devolucion IS NULL OR fecha_devolucion>=fecha_prestamos);
```

Hay que usar un índice para poder indicar el prestamo:
```
CREATE INDEX id_compuesto ON prestamos(libro_id);
```

Además hay que mostrar la verificación para saber si los campos de datos son correctos:
```
SHOW INDEX FROM prestamos;

+-----------+------------+--------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| Table     | Non_unique | Key_name     | Seq_in_index | Column_name | Collation | Cardinality | Sub_part | Packed | Null | Index_type | Comment | Index_comment | Visible | Expression |
+-----------+------------+--------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| prestamos |          0 | PRIMARY      |            1 | id          | A         |           0 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
| prestamos |          1 | fk_socio     |            1 | socio_id    | A         |           0 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
| prestamos |          1 | id_compuesto |            1 | libro_id    | A         |           0 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
+-----------+------------+--------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
3 rows in set (0,05 sec)
```

También podemos intentar colocar dos prestamos, uno activo sin fecha de devolución y uno devuelto,es decir, con fecha de devolución:
```
2 Inserciones:
##Prestamo activo (sin `fecha_devolucion`)

INSERT INTO autores VALUES (
 NULL,
 'Isabel Allende',
 'Chile'
);

INSERT INTO libros (id, titulo, isbn,precio, autor_id)
VALUES (1, 'Fundación', '978-84-123456-7-8','10', 1);

INSERT INTO prestamos (socio_id, libro_id)
VALUES (1, 1);


##Prestamo devuelto (`fecha_devolucion` ≥ `fecha_prestamo`)


INSERT INTO autores VALUES (NUll, 'María Dueñas','Paraguay');

Query OK, 1 row affected (0,05 sec)

INSERT INTO libros (id, titulo, isbn,precio, autor_id)
VALUES (2, 'El tiempo entre costuras', '978-84-08-09484-0','10', 2);

Query OK, 1 row affected (0,03 sec)


INSERT INTO prestamos (socio_id, libro_id, fecha_prestamos, fecha_devolucion)
VALUES (1, 2, '2025-10-01', '2025-10-15');

Query OK, 1 row affected (0,03 sec)

---TABLAS PRESTAMOS---
+----+----------+----------+-----------------+------------------+
| id | socio_id | libro_id | fecha_prestamos | fecha_devolucion |
+----+----------+----------+-----------------+------------------+
|  1 |        1 |        1 | 2025-10-31      | NULL             |
|  2 |        1 |        2 | 2025-10-01      | 2025-10-15       |
+----+----------+----------+-----------------+------------------+
```

Comprobamos introducir datos de un prestamos con una fecha de devolución que debe fallar:
```
 INSERT INTO prestamos (socio_id, libro_id, fecha_prestamos, fecha_devolucion)
    -> VALUES (1, 2, '2025-10-15', '2025-10-01');
    
---Evidencia---    
ERROR 3819 (HY000): Check constraint 'prestamos_chk_1' is violated.

DESCRIBE prestamos;

+------------------+------+------+-----+-----------+-------------------+
| Field            | Type | Null | Key | Default   | Extra             |
+------------------+------+------+-----+-----------+-------------------+
| id               | int  | NO   | PRI | NULL      | auto_increment    |
| socio_id         | int  | NO   | MUL | NULL      |                   |
| libro_id         | int  | NO   | MUL | NULL      |                   |
| fecha_prestamos  | date | NO   |     | curdate() | DEFAULT_GENERATED |
| fecha_devolucion | date | YES  |     | NULL      |                   |
+------------------+------+------+-----+-----------+-------------------+
5 rows in set (0,00 sec)

SHOW INDEX FROM prestamos;

+-----------+------------+--------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| Table     | Non_unique | Key_name     | Seq_in_index | Column_name | Collation | Cardinality | Sub_part | Packed | Null | Index_type | Comment | Index_comment | Visible | Expression |
+-----------+------------+--------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| prestamos |          0 | PRIMARY      |            1 | id          | A         |           0 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
| prestamos |          1 | fk_socio     |            1 | socio_id    | A         |           0 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
| prestamos |          1 | id_compuesto |            1 | libro_id    | A         |           0 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
+-----------+------------+--------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
3 rows in set (0,00 sec)
```

Como quinto paso, hacemos inserciones de prueba:
```
* Inserta al menos:

  * **3 autores**
  * **3 libros** (cada uno referenciando a un `autor_id` existente)
  * **2 socios**
  * **2 préstamos** (1 activo, 1 devuelto)


INSERT INTO autores VALUES
(NULL, 'Laura Gallego','Jamaica'),
(NULL, 'Carlos Ruiz Zafón','Jamaica'),
(NULL, 'Matilde Asensi','Jamaica');

Query OK, 3 rows affected (0,04 sec)
Records: 3  Duplicates: 0  Warnings: 0


INSERT INTO libros (id, titulo, isbn,precio, autor_id) VALUES
(NULL, 'Memorias de Idhún', '978-84-08-12345-6','75', 1),
(NULL, 'La sombra del viento', '978-84-08-23456-7','50', 2),
(NULL, 'El último catón', '978-84-08-34567-8','150', 3);

Query OK, 3 rows affected (0,08 sec)
Records: 3  Duplicates: 0  Warnings: 0

---PRESTAMO ACTIVO---
INSERT INTO prestamos (socio_id, libro_id, fecha_prestamos)
VALUES (1, 1, '2025-10-25');


---PRESTAMO DEVUELTO---
INSERT INTO prestamos (socio_id, libro_id, fecha_prestamos, fecha_devolucion)
VALUES (2, 2, '2025-10-10', '2025-10-20');

```

Hacemos la verificación de los datos desde la terminal para comprobar si han sido registrados usando SELECT básicos:
```
SELECT * FROM autores;

+----+--------------------+----------+
| id | nombres            | pais     |
+----+--------------------+----------+
|  1 | Isabel Allende     | Chile    |
|  2 | María Dueñas       | Paraguay |
|  3 | Laura Gallego      | Jamaica  |
|  4 | Carlos Ruiz Zafón  | Jamaica  |
|  5 | Matilde Asensi     | Jamaica  |
+----+--------------------+----------+
5 rows in set (0,00 sec)


SELECT * FROM libros;

+----+--------------------------+-------------------+--------+----------+
| id | titulo                   | isbn              | precio | autor_id |
+----+--------------------------+-------------------+--------+----------+
|  1 | Fundación                | 978-84-123456-7-8 |  10.00 |        1 |
|  2 | El tiempo entre costuras | 978-84-08-09484-0 |  10.00 |        2 |
|  3 | Memorias de Idhún        | 978-84-08-12345-6 |  75.00 |        1 |
|  4 | La sombra del viento     | 978-84-08-23456-7 |  50.00 |        2 |
|  5 | El último catón          | 978-84-08-34567-8 | 150.00 |        3 |
+----+--------------------------+-------------------+--------+----------+
5 rows in set (0,00 sec)

SELECT * FROM prestamos;

+----+----------+----------+-----------------+------------------+
| id | socio_id | libro_id | fecha_prestamos | fecha_devolucion |
+----+----------+----------+-----------------+------------------+
|  1 |        1 |        1 | 2025-10-31      | NULL             |
|  2 |        1 |        2 | 2025-10-01      | 2025-10-15       |
|  3 |        1 |        1 | 2025-10-25      | NULL             |
|  4 |        2 |        2 | 2025-10-10      | 2025-10-20       |
+----+----------+----------+-----------------+------------------+
4 rows in set (0,01 sec)

## Paso final (2’): Resumen de comprobaciones finales

sql
SHOW TABLES;

+------------------------+
| Tables_in_biblioteca25 |
+------------------------+
| autores                |
| libros                 |
| prestamos              |
+------------------------+
3 rows in set (0,00 sec)

DESCRIBE autores;

+---------+--------------+------+-----+---------+----------------+
| Field   | Type         | Null | Key | Default | Extra          |
+---------+--------------+------+-----+---------+----------------+
| id      | int          | NO   | PRI | NULL    | auto_increment |
| nombres | varchar(100) | YES  |     | NULL    |                |
| pais    | varchar(80)  | YES  |     | NULL    |                |
+---------+--------------+------+-----+---------+----------------+
3 rows in set (0,02 sec)

DESCRIBE libros;

+----------+--------------+------+-----+---------+----------------+
| Field    | Type         | Null | Key | Default | Extra          |
+----------+--------------+------+-----+---------+----------------+
| id       | int          | NO   | PRI | NULL    | auto_increment |
| titulo   | varchar(200) | NO   | MUL | NULL    |                |
| isbn     | varchar(20)  | NO   |     | NULL    |                |
| precio   | decimal(8,2) | NO   |     | NULL    |                |
| autor_id | int          | NO   | MUL | NULL    |                |
+----------+--------------+------+-----+---------+----------------+
5 rows in set (0,00 sec)

DESCRIBE prestamos;

+------------------+------+------+-----+-----------+-------------------+
| Field            | Type | Null | Key | Default   | Extra             |
+------------------+------+------+-----+-----------+-------------------+
| id               | int  | NO   | PRI | NULL      | auto_increment    |
| socio_id         | int  | NO   | MUL | NULL      |                   |
| libro_id         | int  | NO   | MUL | NULL      |                   |
| fecha_prestamos  | date | NO   |     | curdate() | DEFAULT_GENERATED |
| fecha_devolucion | date | YES  |     | NULL      |                   |
+------------------+------+------+-----+-----------+-------------------+
5 rows in set (0,00 sec)
```

3.-Aplicación:
Podemos aplicar una base de datos con restricciones, claves primarias, claves ajenas y índices para cualquier ámbito o programa donde necesistemos registrar datos y poder organizarlos día a día en vez de escribir manualmente.

4.-Conclusión:
Al crear una base de datos con restricciones, claves primarias, claves ajenas y índices, hemos podido organizar los datos de una manera organizada, esquemática y con reglas para que no haya redudancia o errores al introducir datos.

Código:
```
##PASO 1:

CREATE DATABASE biblioteca25;
USE biblioteca25;

**Evidencia:**

SELECT DATABASE();
+--------------+
| DATABASE()   |
+--------------+
| biblioteca25 |
+--------------+
1 row in set (0,00 sec)

---Ha mostrado que existe la base de dato biblioteca25

##PASO 2:
---TABLA AUTORES-------
CREATE TABLE autores (
 nombres VARCHAR(100),
 pais VARCHAR(80)
);

ALTER TABLE autores
ADD COLUMN id INT AUTO_INCREMENT PRIMARY KEY FIRST;

DESCRIBE autores;

**Verificación:**

+---------+--------------+------+-----+---------+----------------+
| Field   | Type         | Null | Key | Default | Extra          |
+---------+--------------+------+-----+---------+----------------+
| id      | int          | NO   | PRI | NULL    | auto_increment |
| nombres | varchar(100) | YES  |     | NULL    |                |
| pais    | varchar(80)  | YES  |     | NULL    |                |
+---------+--------------+------+-----+---------+----------------+
3 rows in set (0,00 sec)


#PASO 3:

---TABLA LIBROS---
CREATE TABLE libros (
 titulo VARCHAR(200) NOT NULL,
 isbn VARCHAR(20) NOT NULL,
 precio DECIMAL(8,2) NOT NULL,
 autor_id INT NOT NULL
);

--- Clave primaria para id---
---Rasgo de precio----
ALTER TABLE libros
ADD COLUMN id INT AUTO_INCREMENT PRIMARY KEY FIRST;
ALTER TABLE libros ADD CHECK (precio >= 0);

---Clave foranea--------
---ON DELETE RESTRICT---
---ON UPDATE CASCADE;---
ALTER TABLE libros
ADD CONSTRAINT fk_autor_id
FOREIGN KEY (autor_id) REFERENCES autores(id)
ON DELETE RESTRICT
ON UPDATE CASCADE;

CREATE INDEX titulo_index ON libros(titulo);




**Verificación:**
SHOW INDEX FROM libros;

INSERT INTO libros VALUES(
 1,
 'Titulo del Libro',
 '12345678910111213',
 '-5.3',
 1
);

**Evidencia:**
DESCRIBE libros;
+----------+--------------+------+-----+---------+----------------+
| Field    | Type         | Null | Key | Default | Extra          |
+----------+--------------+------+-----+---------+----------------+
| id       | int          | NO   | PRI | NULL    | auto_increment |
| titulo   | varchar(200) | YES  | MUL | NULL    |                |
| isbn     | varchar(20)  | YES  |     | NULL    |                |
| precio   | decimal(8,2) | YES  |     | NULL    |                |
| autor_id | int          | NO   | MUL | NULL    |                |
+----------+--------------+------+-----+---------+----------------+
5 rows in set (0,00 sec)


SHOW INDEX FROM libros;

+--------+------------+--------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| Table  | Non_unique | Key_name     | Seq_in_index | Column_name | Collation | Cardinality | Sub_part | Packed | Null | Index_type | Comment | Index_comment | Visible | Expression |
+--------+------------+--------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| libros |          0 | PRIMARY      |            1 | id          | A         |           0 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
| libros |          1 | fk_autor_id  |            1 | autor_id    | A         |           0 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
| libros |          1 | titulo_index |            1 | titulo      | A         |           0 |     NULL |   NULL | YES  | BTREE      |         |               | YES     | NULL       |
+--------+------------+--------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
3 rows in set (0,00 sec)


* (Si probaste el fallo) el mensaje de error del `CHECK`.

ERROR 3819 (HY000): Check constraint 'libros_chk_1' is violated.



##PASO 5:

CREATE TABLE prestamos (
 id INT AUTO_INCREMENT PRIMARY KEY,
 socio_id INT NOT NULL,
 libro_id INT NOT NULL,
 fecha_prestamos DATE NOT NULL DEFAULT(CURRENT_DATE),
 fecha_devolucion DATE NULL
);

ALTER TABLE prestamos
ADD CONSTRAINT fk_socio
FOREIGN KEY (socio_id) REFERENCES prestamos(id)
ON UPDATE CASCADE
ON DELETE CASCADE;

ALTER TABLE prestamos
ADD CONSTRAINT fk_libro
FOREIGN KEY (libro_id) REFERENCES prestamos(id) 
ON UPDATE CASCADE
ON DELETE RESTRICT;


ALTER TABLE prestamos ADD CHECK (fecha_devolucion IS NULL OR fecha_devolucion>=fecha_prestamos);

CREATE INDEX id_compuesto ON prestamos(libro_id);

**Verificación:**

SHOW INDEX FROM prestamos;

+-----------+------------+--------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| Table     | Non_unique | Key_name     | Seq_in_index | Column_name | Collation | Cardinality | Sub_part | Packed | Null | Index_type | Comment | Index_comment | Visible | Expression |
+-----------+------------+--------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| prestamos |          0 | PRIMARY      |            1 | id          | A         |           0 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
| prestamos |          1 | fk_socio     |            1 | socio_id    | A         |           0 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
| prestamos |          1 | id_compuesto |            1 | libro_id    | A         |           0 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
+-----------+------------+--------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
3 rows in set (0,05 sec)




2 Inserciones:
##Prestamo activo (sin `fecha_devolucion`)

INSERT INTO autores VALUES (
 NULL,
 'Isabel Allende',
 'Chile'
);

INSERT INTO libros (id, titulo, isbn,precio, autor_id)
VALUES (1, 'Fundación', '978-84-123456-7-8','10', 1);

INSERT INTO prestamos (socio_id, libro_id)
VALUES (1, 1);

##Prestamo devuelto (`fecha_devolucion` ≥ `fecha_prestamo`)


INSERT INTO autores VALUES (NUll, 'María Dueñas','Paraguay');

Query OK, 1 row affected (0,05 sec)

INSERT INTO libros (id, titulo, isbn,precio, autor_id)
VALUES (2, 'El tiempo entre costuras', '978-84-08-09484-0','10', 2);

Query OK, 1 row affected (0,03 sec)


INSERT INTO prestamos (socio_id, libro_id, fecha_prestamos, fecha_devolucion)
VALUES (1, 2, '2025-10-01', '2025-10-15');

Query OK, 1 row affected (0,03 sec)

---TABLAS PRESTAMOS---
+----+----------+----------+-----------------+------------------+
| id | socio_id | libro_id | fecha_prestamos | fecha_devolucion |
+----+----------+----------+-----------------+------------------+
|  1 |        1 |        1 | 2025-10-31      | NULL             |
|  2 |        1 |        2 | 2025-10-01      | 2025-10-15       |
+----+----------+----------+-----------------+------------------+


---Comprobamos introducir datos de un prestamos con una fecha de devolución que debe fallar---
 INSERT INTO prestamos (socio_id, libro_id, fecha_prestamos, fecha_devolucion)
    -> VALUES (1, 2, '2025-10-15', '2025-10-01');
    
---Evidencia---    
ERROR 3819 (HY000): Check constraint 'prestamos_chk_1' is violated.

DESCRIBE prestamos;

+------------------+------+------+-----+-----------+-------------------+
| Field            | Type | Null | Key | Default   | Extra             |
+------------------+------+------+-----+-----------+-------------------+
| id               | int  | NO   | PRI | NULL      | auto_increment    |
| socio_id         | int  | NO   | MUL | NULL      |                   |
| libro_id         | int  | NO   | MUL | NULL      |                   |
| fecha_prestamos  | date | NO   |     | curdate() | DEFAULT_GENERATED |
| fecha_devolucion | date | YES  |     | NULL      |                   |
+------------------+------+------+-----+-----------+-------------------+
5 rows in set (0,00 sec)

SHOW INDEX FROM prestamos;

+-----------+------------+--------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| Table     | Non_unique | Key_name     | Seq_in_index | Column_name | Collation | Cardinality | Sub_part | Packed | Null | Index_type | Comment | Index_comment | Visible | Expression |
+-----------+------------+--------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| prestamos |          0 | PRIMARY      |            1 | id          | A         |           0 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
| prestamos |          1 | fk_socio     |            1 | socio_id    | A         |           0 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
| prestamos |          1 | id_compuesto |            1 | libro_id    | A         |           0 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
+-----------+------------+--------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
3 rows in set (0,00 sec)

* Inserta al menos:

  * **3 autores**
  * **3 libros** (cada uno referenciando a un `autor_id` existente)
  * **2 socios**
  * **2 préstamos** (1 activo, 1 devuelto)


INSERT INTO autores VALUES
(NULL, 'Laura Gallego','Jamaica'),
(NULL, 'Carlos Ruiz Zafón','Jamaica'),
(NULL, 'Matilde Asensi','Jamaica');

Query OK, 3 rows affected (0,04 sec)
Records: 3  Duplicates: 0  Warnings: 0


INSERT INTO libros (id, titulo, isbn,precio, autor_id) VALUES
(NULL, 'Memorias de Idhún', '978-84-08-12345-6','75', 1),
(NULL, 'La sombra del viento', '978-84-08-23456-7','50', 2),
(NULL, 'El último catón', '978-84-08-34567-8','150', 3);

Query OK, 3 rows affected (0,08 sec)
Records: 3  Duplicates: 0  Warnings: 0

---PRESTAMO ACTIVO---
INSERT INTO prestamos (socio_id, libro_id, fecha_prestamos)
VALUES (1, 1, '2025-10-25');


---PRESTAMO DEVUELTO---
INSERT INTO prestamos (socio_id, libro_id, fecha_prestamos, fecha_devolucion)
VALUES (2, 2, '2025-10-10', '2025-10-20');




**Verificación:** 
USANDO SELECT básicos:

SELECT * FROM autores;

+----+--------------------+----------+
| id | nombres            | pais     |
+----+--------------------+----------+
|  1 | Isabel Allende     | Chile    |
|  2 | María Dueñas       | Paraguay |
|  3 | Laura Gallego      | Jamaica  |
|  4 | Carlos Ruiz Zafón  | Jamaica  |
|  5 | Matilde Asensi     | Jamaica  |
+----+--------------------+----------+
5 rows in set (0,00 sec)


SELECT * FROM libros;

+----+--------------------------+-------------------+--------+----------+
| id | titulo                   | isbn              | precio | autor_id |
+----+--------------------------+-------------------+--------+----------+
|  1 | Fundación                | 978-84-123456-7-8 |  10.00 |        1 |
|  2 | El tiempo entre costuras | 978-84-08-09484-0 |  10.00 |        2 |
|  3 | Memorias de Idhún        | 978-84-08-12345-6 |  75.00 |        1 |
|  4 | La sombra del viento     | 978-84-08-23456-7 |  50.00 |        2 |
|  5 | El último catón          | 978-84-08-34567-8 | 150.00 |        3 |
+----+--------------------------+-------------------+--------+----------+
5 rows in set (0,00 sec)

SELECT * FROM prestamos;

+----+----------+----------+-----------------+------------------+
| id | socio_id | libro_id | fecha_prestamos | fecha_devolucion |
+----+----------+----------+-----------------+------------------+
|  1 |        1 |        1 | 2025-10-31      | NULL             |
|  2 |        1 |        2 | 2025-10-01      | 2025-10-15       |
|  3 |        1 |        1 | 2025-10-25      | NULL             |
|  4 |        2 |        2 | 2025-10-10      | 2025-10-20       |
+----+----------+----------+-----------------+------------------+
4 rows in set (0,01 sec)

## Paso final (2’): Resumen de comprobaciones finales

sql
SHOW TABLES;

+------------------------+
| Tables_in_biblioteca25 |
+------------------------+
| autores                |
| libros                 |
| prestamos              |
+------------------------+
3 rows in set (0,00 sec)

DESCRIBE autores;

+---------+--------------+------+-----+---------+----------------+
| Field   | Type         | Null | Key | Default | Extra          |
+---------+--------------+------+-----+---------+----------------+
| id      | int          | NO   | PRI | NULL    | auto_increment |
| nombres | varchar(100) | YES  |     | NULL    |                |
| pais    | varchar(80)  | YES  |     | NULL    |                |
+---------+--------------+------+-----+---------+----------------+
3 rows in set (0,02 sec)

DESCRIBE libros;

+----------+--------------+------+-----+---------+----------------+
| Field    | Type         | Null | Key | Default | Extra          |
+----------+--------------+------+-----+---------+----------------+
| id       | int          | NO   | PRI | NULL    | auto_increment |
| titulo   | varchar(200) | NO   | MUL | NULL    |                |
| isbn     | varchar(20)  | NO   |     | NULL    |                |
| precio   | decimal(8,2) | NO   |     | NULL    |                |
| autor_id | int          | NO   | MUL | NULL    |                |
+----------+--------------+------+-----+---------+----------------+
5 rows in set (0,00 sec)

DESCRIBE prestamos;

+------------------+------+------+-----+-----------+-------------------+
| Field            | Type | Null | Key | Default   | Extra             |
+------------------+------+------+-----+-----------+-------------------+
| id               | int  | NO   | PRI | NULL      | auto_increment    |
| socio_id         | int  | NO   | MUL | NULL      |                   |
| libro_id         | int  | NO   | MUL | NULL      |                   |
| fecha_prestamos  | date | NO   |     | curdate() | DEFAULT_GENERATED |
| fecha_devolucion | date | YES  |     | NULL      |                   |
+------------------+------+------+-----+-----------+-------------------+
5 rows in set (0,00 sec)
```
