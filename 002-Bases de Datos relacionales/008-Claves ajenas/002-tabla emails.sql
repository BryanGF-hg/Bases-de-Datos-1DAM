-- crear tabla email
CREATE TABLE email (
  direccion varchar(50),
  persona varchar(255)
);

-- añado identificador

ALTER TABLE email
ADD COLUMN identificador INT AUTO_INCREMENT PRIMARY KEY FIRST;

SHOW TABLES;
