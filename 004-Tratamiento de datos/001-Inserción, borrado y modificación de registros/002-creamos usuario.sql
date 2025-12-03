CREATE USER 
'equipo_paises'@'localhost' 
IDENTIFIED  BY 'Paises2526$';

GRANT USAGE ON *.* TO 'equipo_paises'@'localhost';

ALTER USER 'equipo_paises'@'localhost' 
REQUIRE NONE 
WITH MAX_QUERIES_PER_HOUR 0 
MAX_CONNECTIONS_PER_HOUR 0 
MAX_UPDATES_PER_HOUR 0 
MAX_USER_CONNECTIONS 0;


GRANT ALL PRIVILEGES ON paises.* 
TO 'equipo_paises'@'localhost';

FLUSH PRIVILEGES;
