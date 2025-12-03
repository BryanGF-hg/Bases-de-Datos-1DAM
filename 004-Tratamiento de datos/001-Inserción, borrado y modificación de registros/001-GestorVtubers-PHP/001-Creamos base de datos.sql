-- Crear la base de datos
CREATE DATABASE vtubers;
USE vtubers;

-- Crear la tabla
CREATE TABLE holoen_vtubers (
    id INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Branch VARCHAR(100) NOT NULL,
    MainColor VARCHAR(10) NOT NULL,
    BackgroundColor VARCHAR(10) NOT NULL
);

-- Insertar todos los miembros de Hololive English
INSERT INTO holoen_vtubers (Name, Branch, MainColor, BackgroundColor) VALUES
-- HOLOLIVE EN MYTH
('Mori Calliope', 'Myth', '#FF4E6A', '#1A1A1A'),
('Takanashi Kiara', 'Myth', '#FF8A00', '#FFF2CC'),
('Ninomae Inanis', 'Myth', '#6A5ACD', '#1F1A3D'),
('Gawr Gura', 'Myth', '#4CC7FF', '#003F66'),
('Watson Amelia', 'Myth', '#F5D77F', '#8C6F3A'),

-- HOLOLIVE EN COUNCIL
('Tsukumo Sana', 'Council', '#FFB3DA', '#4B003D'),
('Ceres Fauna', 'Council', '#7ED957', '#0D2600'),
('Ouro Kronii', 'Council', '#4C89FF', '#0A1A33'),
('Nanashi Mumei', 'Council', '#C2A57A', '#3A3227'),
('Hakos Baelz', 'Council', '#FF2E2E', '#1A0000'),
('IRyS', 'Council', '#FF4FAE', '#2A0020'),

-- HOLOLIVE EN ADVENT
('Shiori Novella', 'Advent', '#A060FF', '#1E0A33'),
('Koseki Bijou', 'Advent', '#63F5FF', '#004B52'),
('Fuwawa Abyssgard', 'Advent', '#FFAACF', '#3B1A24'),
('Mococo Abyssgard', 'Advent', '#FFAACF', '#3B1A24'),
('Nerissa Ravencroft', 'Advent', '#3E3E7A', '#0B0B1E'),

-- HOLOLIVE EN JUSTICE
('Elizabeth Rose Bloodflame', 'Justice', '#FF7095', '#3D0A15'),
('Cecilia Immergreen', 'Justice', '#7A35FF', '#150A33'),
('Gigi Murin', 'Justice', '#8CE6FF', '#002A33'),
('Raora Panthera', 'Justice', '#FF8C2E', '#331A00');

