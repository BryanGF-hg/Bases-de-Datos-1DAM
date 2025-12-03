CREATE TABLE Persona (
  id INT PRIMARY KEY AUTO_INCREMENTAL,
  nombre VARCHAR(255),
  apellidos VARCHAR(255)
);

CREATE TABLE Alumno (
  id INT PRIMARY KEY AUTO_INCREMENTAL,
  DNINIA VARCHAR(15),
  id_persona INT,
	 CONSTRAINT fk_formacion_1 FOREIGN KEY (id_persona) REFERENCES Persona(id)
);

CREATE TABLE Profesor(
	 id INT PRIMARY KEY AUTO_INCREMENTAL,
  asignaturas SET,
  id_persona INT,
	 CONSTRAINT fk_formacion_2 FOREIGN KEY (id_persona) REFERENCES Persona(id)
);
