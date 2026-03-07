INSERT INTO alumnos (Identificador, nombre, apellidos) VALUES
(1, 'María', 'González Pérez'),
(2, 'Carlos', 'Rodríguez López'),
(3, 'Ana', 'Martínez Sánchez'),
(4, 'Javier', 'Fernández García'),
(5, 'Laura', 'Díaz Romero'),
(6, 'David', 'Ruiz Hernández'),
(7, 'Elena', 'Moreno Jiménez'),
(8, 'Pedro', 'Álvarez Martín'),
(9, 'Sofía', 'Navarro Castro'),
(10, 'Miguel', 'Torres Ortega'),
(11, 'Isabel', 'Romero Vargas'),
(12, 'Pablo', 'Molina Santos'),
(13, 'Carmen', 'Gil Domínguez'),
(14, 'Raúl', 'Ortega Cruz'),
(15, 'Beatriz', 'Marín Reyes'),
(16, 'Daniel', 'Cabrera Flores'),
(17, 'Patricia', 'Ramos Medina'),
(18, 'Sergio', 'Vega Campos'),
(19, 'Teresa', 'Fuentes León'),
(20, 'Alberto', 'Herrera Núñez');

INSERT INTO profesores (Identificador, nombre, apellidos) VALUES
(1, 'Roberto', 'Silva Mendoza'),
(2, 'Elena', 'Castro Ríos'),
(3, 'Antonio', 'Méndez Paredes'),
(4, 'Claudia', 'Rojas Velasco'),
(5, 'Fernando', 'Miranda Lagos'),
(6, 'Gabriela', 'Quiroga Salas'),
(7, 'Ricardo', 'Peña Cordero'),
(8, 'Diana', 'Lara Montes'),
(9, 'Julián', 'Cordero Rivas'),
(10, 'Valeria', 'Paredes Solís');

INSERT INTO asignaturas (Identificador, nombre, id_profesor) VALUES
(1, 'Matemáticas Avanzadas', 1),
(2, 'Literatura Española', 2),
(3, 'Historia Universal', 3),
(4, 'Física Cuántica', 4),
(5, 'Programación en Python', 5),
(6, 'Bases de Datos', 6),
(7, 'Inglés Técnico', 7),
(8, 'Química Orgánica', 8),
(9, 'Estadística Aplicada', 9),
(10, 'Derecho Constitucional', 10),
(11, 'Economía Internacional', 1),
(12, 'Arte Contemporáneo', 2),
(13, 'Biología Molecular', 4),
(14, 'Redes de Computadoras', 5),
(15, 'Psicología Educativa', 8);

INSERT INTO matriculas (Identificador, id_asignatura, id_alumno) VALUES
-- Alumno 1 (María) se matricula en 5 asignaturas
(1, 1, 1), (2, 2, 1), (3, 5, 1), (4, 7, 1), (5, 9, 1),

-- Alumno 2 (Carlos) se matricula en 4 asignaturas
(6, 3, 2), (7, 4, 2), (8, 6, 2), (9, 8, 2),

-- Alumno 3 (Ana) se matricula en 6 asignaturas
(10, 1, 3), (11, 2, 3), (12, 5, 3), (13, 7, 3), (14, 10, 3), (15, 12, 3),

-- Alumno 4 (Javier) se matricula en 5 asignaturas
(16, 3, 4), (17, 4, 4), (18, 6, 4), (19, 8, 4), (20, 14, 4),

-- Alumno 5 (Laura) se matricula en 4 asignaturas
(21, 1, 5), (22, 5, 5), (23, 9, 5), (24, 11, 5),

-- Alumno 6 (David) se matricula en 5 asignaturas
(25, 2, 6), (26, 4, 6), (27, 7, 6), (28, 10, 6), (29, 13, 6),

-- Alumno 7 (Elena) se matricula en 6 asignaturas
(30, 3, 7), (31, 5, 7), (32, 6, 7), (33, 8, 7), (34, 12, 7), (35, 15, 7),

-- Alumno 8 (Pedro) se matricula en 4 asignaturas
(36, 1, 8), (37, 4, 8), (38, 9, 8), (39, 14, 8),

-- Alumno 9 (Sofía) se matricula en 5 asignaturas
(40, 2, 9), (41, 5, 9), (42, 7, 9), (43, 11, 9), (44, 13, 9),

-- Alumno 10 (Miguel) se matricula en 6 asignaturas
(45, 3, 10), (46, 6, 10), (47, 8, 10), (48, 10, 10), (49, 12, 10), (50, 15, 10),

-- Alumno 11 (Isabel) se matricula en 5 asignaturas
(51, 1, 11), (52, 4, 11), (53, 7, 11), (54, 9, 11), (55, 14, 11),

-- Alumno 12 (Pablo) se matricula en 4 asignaturas
(56, 2, 12), (57, 5, 12), (58, 8, 12), (59, 11, 12),

-- Alumno 13 (Carmen) se matricula en 6 asignaturas
(60, 3, 13), (61, 6, 13), (62, 7, 13), (63, 10, 13), (64, 12, 13), (65, 15, 13),

-- Alumno 14 (Raúl) se matricula en 5 asignaturas
(66, 1, 14), (67, 4, 14), (68, 9, 14), (69, 13, 14), (70, 14, 14),

-- Alumno 15 (Beatriz) se matricula en 4 asignaturas
(71, 2, 15), (72, 5, 15), (73, 8, 15), (74, 11, 15),

-- Alumno 16 (Daniel) se matricula en 5 asignaturas
(75, 3, 16), (76, 6, 16), (77, 7, 16), (78, 10, 16), (79, 15, 16),

-- Alumno 17 (Patricia) se matricula en 6 asignaturas
(80, 1, 17), (81, 4, 17), (82, 5, 17), (83, 9, 17), (84, 12, 17), (85, 14, 17),

-- Alumno 18 (Sergio) se matricula en 4 asignaturas
(86, 2, 18), (87, 6, 18), (88, 8, 18), (89, 13, 18),

-- Alumno 19 (Teresa) se matricula en 5 asignaturas
(90, 3, 19), (91, 5, 19), (92, 7, 19), (93, 10, 19), (94, 15, 19),

-- Alumno 20 (Alberto) se matricula en 6 asignaturas
(95, 1, 20), (96, 4, 20), (97, 6, 20), (98, 9, 20), (99, 11, 20), (100, 14, 20);

