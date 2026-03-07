DELIMITER //

CREATE PROCEDURE insertar()
BEGIN

    IF (SELECT COUNT(*) 
        FROM clientes 
        WHERE email='info@josevicentecarratala.com') = 0
    THEN
        INSERT INTO clientes
        VALUES(
            NULL,
            'Jose Vicente',
            'Carratalá Sanchis',
            'info@josevicentecarratala.com',
            'La calle de Jose Vicente'
        );
    END IF;

END //

DELIMITER ;
