INSERT INTO clientes VALUES(
 NULL,
 '12345678A',
 'Nombre',
 'Apellido1 Apellido2',
 'info@gmail.com'
);

ERROR 3819 (HY000): Check constraint 'comprobar_dni_nie_letra' is violated.

INSERT INTO clientes VALUES(
 NULL,
 '12345678Z',
 'Nombre',
 'Apellido1 Apellido2',
 'correoincorrecto'
);

ERROR 3819 (HY000): Check constraint 'comprobar_demail' is violated.

