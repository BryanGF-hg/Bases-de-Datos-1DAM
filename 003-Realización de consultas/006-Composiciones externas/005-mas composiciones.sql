SELECT 
*
FROM matriculas
LEFT JOIN asignaturas
ON matriculas.id_asignatura = asignaturas.Identificador;
LEFT JOIN alumnos
ON matriculas.id_alumno = alumnos.Identificador;
