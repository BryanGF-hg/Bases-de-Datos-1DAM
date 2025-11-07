--Paso 1: cambiar el tipo de columna
ALTER TABLE email
MODIFY COLUMN persona INT;

--PASO 2: crear la foreign key
ALTER TABLE email
ADD CONSTRAINT fk_email_personas
FOREIGN KEY (persona) REFERENCES personas(identificador)
ON DELETE CASCADE
ON UPDATE CASCADE;

ALTER TABLE emails                                       --Altera la tabla de emails
ADD CONSTRAINT fk_emails_personas                        --Crea una restricción con este nombre
FOREIGN KEY (persona)                                    --Creamos una clave hacia persona
REFERENCES personas(identificador)                       --que referencia el identificador 
ON DELETE CASCADE                                        --Cuando elimines, cascada
ON UPDATE CASCADE;                                       --Cuando actualices, cascada

SHOW TABLES;
