--Crea una tabla de productos
Que tenga:

---identificador clave primaria auto incremental
--nombre varchar(255)
--descripcion text
--precio decimal(5,2) -- 5 componentes enteros y 2 decimales
--stock int

Y crear restricciones:
stock no puede ser negativo

precio no puede ser negativo
precio no puede superar los 5000 euros

el nombre del producto tiene que tener al menos 5 caracteres

**REstricciones**
ALTER TABLE productos ADD CHECK (stock >= 0);
ALTER TABLE productos ADD CHECK (precio >= 0);
ALTER TABLE productos ADD CHECK (precio <= 5000);
ALTER TABLE productos ADD CHECK (CHAR_LENGTH(nombre) >= 5);
