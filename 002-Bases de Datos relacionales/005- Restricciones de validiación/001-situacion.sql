sudo mysql -u root -p

SHOW DATABASES;

USE empresadam;

SHOW TABLES;

DESCRIBE clientes;

SELECT * FROM clientes;


ALTER TABLE clientes
 ADD CONSTRAINT comprobar_email
 CHECK (email REGEXP '^[A-Za-z0-9.%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$')
