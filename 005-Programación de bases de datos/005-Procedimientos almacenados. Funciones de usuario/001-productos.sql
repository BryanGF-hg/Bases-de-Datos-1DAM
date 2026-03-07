CREATE TABLE productos(
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255),
    descripcion VARCHAR(255),
    precio DECIMAL(10,2),
    stock INT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO productos (nombre, descripcion, precio, stock) VALUES
('Portátil Pro X', 'Portátil ligero profesional', 1299.99, 10),
('Ratón Óptico', 'Ratón USB ergonómico', 15.50, 120),
('Teclado Mecánico', 'Teclado gaming RGB', 89.99, 45),
('Monitor 24"', 'Monitor Full HD', 179.00, 30),
('Monitor 27"', 'Monitor QHD', 299.00, 20),
('Disco SSD 1TB', 'Almacenamiento rápido', 95.99, 60),
('Disco SSD 512GB', 'SSD compacto', 55.90, 80),
('Memoria RAM 16GB', 'DDR4 alta velocidad', 72.50, 50),
('Memoria RAM 32GB', 'DDR4 profesional', 140.00, 25),
('Impresora Láser', 'Impresión monocromo', 210.00, 15),

('Webcam HD', 'Cámara para videollamadas', 39.95, 70),
('Auriculares Pro', 'Cancelación de ruido', 129.99, 40),
('Altavoces USB', 'Sonido estéreo', 25.00, 90),
('Tablet 10"', 'Tablet multimedia', 249.00, 18),
('Smartphone Nova', 'Teléfono inteligente', 699.00, 35),
('Cargador USB-C', 'Carga rápida', 19.99, 150),
('Hub USB', 'Multipuerto USB', 29.99, 65),
('Router WiFi 6', 'Alta velocidad', 159.00, 22),
('Switch 8 Puertos', 'Red gigabit', 49.00, 40),
('Cable HDMI', 'Cable 2 metros', 9.99, 200),

('Silla Oficina', 'Silla ergonómica', 189.00, 12),
('Mesa Escritorio', 'Mesa madera', 220.00, 8),
('Lámpara LED', 'Iluminación escritorio', 35.50, 55),
('Disco Externo 2TB', 'Backup portátil', 110.00, 28),
('Pendrive 128GB', 'Memoria USB', 18.90, 140),
('Tarjeta Gráfica X', 'GPU gaming', 499.99, 10),
('Fuente 650W', 'Fuente alimentación', 79.00, 30),
('Caja PC', 'Torre ATX', 95.00, 25),
('Ventilador CPU', 'Refrigeración', 32.00, 60),
('Micrófono USB', 'Streaming profesional', 85.00, 20);
