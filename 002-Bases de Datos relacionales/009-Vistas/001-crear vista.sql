CREATE VIEW personas_correos AS

SELECT
email.direccion,
personas.nombre,
personas.apellidos
 FROM email
LEFT JOIN personas
ON email.persona = personas.Identificador;

SELECT*FROM personas_correos; -- se comporta como una tabla
