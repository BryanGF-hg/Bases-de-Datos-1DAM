CREATE USER 
'usuario_vtubers'@'localhost' 
IDENTIFIED  BY 'Vtubers123$';

GRANT USAGE ON *.* TO 'usuario_vtubers'@'localhost';

ALTER USER 'usuario_vtubers'@'localhost' 
REQUIRE NONE 
WITH MAX_QUERIES_PER_HOUR 0 
MAX_CONNECTIONS_PER_HOUR 0 
MAX_UPDATES_PER_HOUR 0 
MAX_USER_CONNECTIONS 0;


GRANT ALL PRIVILEGES ON vtubers.* 
TO 'usuario_vtubers'@'localhost';

FLUSH PRIVILEGES;
