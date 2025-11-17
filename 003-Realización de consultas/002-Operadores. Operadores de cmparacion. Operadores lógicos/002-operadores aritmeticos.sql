--sudo mysql -u root -p

USE clientes;

SELECT nombre
FROM clientes;

SELECT
nombre,
apellidos,
edad+500
FROM clientes;

SELECT
nombre,
apellidos,
edad-500
FROM clientes;

SELECT
nombre,
apellidos,
edad*500
FROM clientes;

SELECT
nombre,
apellidos,
edad/500
FROM clientes;
