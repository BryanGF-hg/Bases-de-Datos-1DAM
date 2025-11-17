--sudo mysql -u root -p

CREATE DATABASE clientes;

USE clientes;

CREATE TABLE clientes(
 nombre VARCHAR(255),
 apellidos VARCHAR(255),
 edad INT
);

INSERT INTO clientes VALUES("Juan","Lopez",45);
INSERT INTO clientes VALUES("Juana","Laura",45);
--podemos usar IA para más inserts--


INSERT INTO clientes (nombre, apellidos, edad) VALUES
("Juan", "Lopez", 45),
("Juana", "Laura", 45),
("Carlos", "Martinez", 45),
("Ana", "Gomez", 45),
("Luis", "Fernandez", 45),
("Maria", "Rodriguez", 45),
("Pedro", "Sanchez", 45),
("Lucia", "Perez", 45),
("Miguel", "Torres", 45),
("Laura", "Ramirez", 45),
("Jorge", "Diaz", 45),
("Sofia", "Moreno", 45),
("Raul", "Jimenez", 45),
("Elena", "Ruiz", 45),
("Diego", "Hernandez", 45),
("Isabel", "Castro", 45),
("Alberto", "Vargas", 45),
("Carmen", "Silva", 45),
("Andres", "Ortega", 45),
("Patricia", "Molina", 45),
("Fernando", "Delgado", 45),
("Rosa", "Navarro", 45),
("Ricardo", "Cabrera", 45),
("Natalia", "Aguilar", 45),
("Manuel", "Paredes", 45),
("Claudia", "Santos", 45),
("Hugo", "León", 45),
("Teresa", "Campos", 45),
("Emilio", "Reyes", 45),
("Beatriz", "Romero", 45);

