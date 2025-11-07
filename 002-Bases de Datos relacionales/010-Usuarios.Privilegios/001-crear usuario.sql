-- crea usuario nuevo con contraseña
-- creamos el nombre de usuario que queramos
CREATE USER 
'[tunombredeusuario]'@'[tuservidor]' 
IDENTIFIED  BY '[tucontraseña]';

-- permite acceso a ese usuario
GRANT USAGE ON *.* TO '[tunombredeusuario]'@'[tuservidor]';
--[tuservidor] == localhost
-- La contraseña puede requerir Mayus, minus, carácteres especiales,etc

-- quitale todos los limites que tenga
ALTER USER '[tunombredeusuario]'@'[tuservidor]' 
REQUIRE NONE 
WITH MAX_QUERIES_PER_HOUR 0 
MAX_CONNECTIONS_PER_HOUR 0 
MAX_UPDATES_PER_HOUR 0 
MAX_USER_CONNECTIONS 0;

-- dale acceso a la base de datos
GRANT ALL PRIVILEGES ON `[tubasededatos]`.* 
TO '[tunombredeusuario]'@'[tuservidor]';

-- recarga la tabla de privilegios
FLUSH PRIVILEGES;




CREATE USER 
'[bryangf]'@'[localhost]' 
IDENTIFIED  BY '[Test123$]';

