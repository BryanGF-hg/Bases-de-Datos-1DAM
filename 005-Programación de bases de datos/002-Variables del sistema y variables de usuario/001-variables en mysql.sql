SET @nombre = 'Jose Vicente';
SET @apellidos = 'Carratalá Sanchis';
SET @email = 'info@josevicentecarratala.com';
SET @direccion = 'La calle de Jose Vicente';

INSERT INTO clientes(
    nombre,
    apellidos,
    email,
    direccion
)
VALUES(
    @nombre,
    @apellidos,
    @email,
    @direccion
);
