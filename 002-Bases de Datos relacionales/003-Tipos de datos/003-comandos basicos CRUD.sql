-- Create
INSERT INTO clientes VALUES(
  '12345678A',
  'Bryan',
  'Glot Fong',
  'info@jocarsa.com'
);

Query OK, 1 row affected (0,04 sec)


-- Select
SELECT * FROM clientes;

+-----------+---------+-----------+------------------+
| dni       | nombres | apellidos | email            |
+-----------+---------+-----------+------------------+
| 12345678A | Bryan   | Glot Fong | info@jocarsa.com |
+-----------+---------+-----------+------------------+
1 row in set (0,00 sec)


-- Update

UPDATE clientes
SET email = 'bryan@gmail.com'
WHERE nombres = 'Bryan';

UPDATE clientes
SET apellidos = 'Sazryn Ovyestka'
WHERE nombres = 'Bryan';


-- Delete

DELETE FROM clientes
WHERE dni = '11111111A';
