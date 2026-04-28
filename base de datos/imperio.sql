-- Script SQL generado para cumplir con las consignas del parcial.txt

-- Crear la base de datos si no existe
CREATE DATABASE IF NOT EXISTS Imperio;
USE Imperio;

-- Asegurar la creación de la tabla Jugadores_Planetas
CREATE TABLE IF NOT EXISTS Jugadores_Planetas (
    jugador_id INT NOT NULL,
    planeta_id INT NOT NULL,
    PRIMARY KEY (jugador_id, planeta_id),
    FOREIGN KEY (jugador_id) REFERENCES Jugadores(id),
    FOREIGN KEY (planeta_id) REFERENCES Planetas(id)
);

-- Crear las tablas si no existen
CREATE TABLE IF NOT EXISTS Jugadores (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS Galaxias (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS Planetas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    galaxia_id INT NOT NULL,
    jugador_id INT NOT NULL,
    FOREIGN KEY (galaxia_id) REFERENCES Galaxias(id),
    FOREIGN KEY (jugador_id) REFERENCES Jugadores(id)
);

-- Crear la tabla Planetas_Recursos
CREATE TABLE IF NOT EXISTS Planetas_Recursos (
    planeta_id INT NOT NULL,
    recurso_id INT NOT NULL,
    cantidad INT NOT NULL,
    PRIMARY KEY (planeta_id, recurso_id),
    FOREIGN KEY (planeta_id) REFERENCES Planetas(id),
    FOREIGN KEY (recurso_id) REFERENCES Recursos(id)
);

CREATE TABLE IF NOT EXISTS Naves (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS Planeta_Naves (
    planeta_id INT NOT NULL,
    nave_id INT NOT NULL,
    cantidad INT NOT NULL,
    PRIMARY KEY (planeta_id, nave_id),
    FOREIGN KEY (planeta_id) REFERENCES Planetas(id),
    FOREIGN KEY (nave_id) REFERENCES Naves(id)
);

CREATE TABLE IF NOT EXISTS Edificios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS Planeta_Edificios (
    planeta_id INT NOT NULL,
    edificio_id INT NOT NULL,
    nivel INT NOT NULL,
    PRIMARY KEY (planeta_id, edificio_id),
    FOREIGN KEY (planeta_id) REFERENCES Planetas(id),
    FOREIGN KEY (edificio_id) REFERENCES Edificios(id)
);

CREATE TABLE IF NOT EXISTS Armamentos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS Planeta_Armamentos (
    planeta_id INT NOT NULL,
    armamento_id INT NOT NULL,
    cantidad INT NOT NULL,
    PRIMARY KEY (planeta_id, armamento_id),
    FOREIGN KEY (planeta_id) REFERENCES Planetas(id),
    FOREIGN KEY (armamento_id) REFERENCES Armamentos(id)
);

CREATE TABLE IF NOT EXISTS Lunas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    planeta_id INT NOT NULL,
    FOREIGN KEY (planeta_id) REFERENCES Planetas(id)
);

-- Insertar datos de ejemplo
INSERT INTO Jugadores (nombre) VALUES
('astro_gamer'),
('galactic_ruler'),
('cosmic_explorer'),
('space_commander'),
('stargazer'),
('space_pioneer');

INSERT INTO Galaxias (nombre) VALUES
('Milky Way'),
('Andromeda'),
('Pegasus'),
('Orion'),
('Centaurus');

INSERT INTO Planetas (nombre, galaxia_id, jugador_id) VALUES
('Nova Prime', 1, 1),
('Stellar Haven', 2, 2),
('Astral Oasis', 1, 3),
('Celestial Outpost', 3, 4),
('Galactic Citadel', 4, 5),
('Starlight Sanctuary', 1, 6),
('Celestial Outpost II', 2, 1),
('Nebula Nexus', 3, 2),
('Solar Haven', 1, 3),
('Asteroid Haven', 4, 4);

-- Insertar datos en la tabla Lunas
INSERT INTO Lunas (nombre, planeta_id) VALUES
('Luminara', 1),
('Nightshade', 2),
('Galaxysong', 3),
('StellarDust', 4),
('MoonlightGrove', 5),
('GlimmeringOrbit', 1),
('EclipseHarbor', 2),
('MoonstoneMeadow', 3),
('StellarRefuge', 4),
('CosmicSerenity', 5),
('Luminara II', 6),
('Nightshade II', 7),
('Galaxysong II', 8),
('StellarDust II', 9),
('MoonlightGrove II', 10);

-- Insertar datos en la tabla Naves
INSERT INTO Naves (nombre) VALUES
('Caza Estelar'),
('Destructor Interplanetario'),
('Nave de Colonización'),
('Transportador de Recursos'),
('Nave de Exploración');

-- Insertar datos en la tabla Recursos
INSERT INTO Recursos (nombre) VALUES
('Metal'),
('Deuterio'),
('Energía');

-- Insertar datos en la tabla Armamentos
INSERT INTO Armamentos (nombre) VALUES
('Cañón de Plasma'),
('Torreta de Defensa'),
('Láser de Precisión'),
('Bomba de Neutrinos'),
('Escudo de Energía');

-- Insertar datos en la tabla Edificios
INSERT INTO Edificios (nombre) VALUES
('Mina de Metal'),
('Planta de Energía Solar'),
('Laboratorio de Investigación'),
('Fábrica de Robots'),
('Hangar de Naves');

-- Asignación de planetas a jugadores con verificación para evitar duplicados
INSERT INTO Jugadores_Planetas (jugador_id, planeta_id)
SELECT * FROM (SELECT 1 AS jugador_id, 1 AS planeta_id) AS tmp
WHERE NOT EXISTS (
    SELECT 1 FROM Jugadores_Planetas WHERE jugador_id = 1 AND planeta_id = 1
);

INSERT INTO Jugadores_Planetas (jugador_id, planeta_id)
SELECT * FROM (SELECT 1 AS jugador_id, 3 AS planeta_id) AS tmp
WHERE NOT EXISTS (
    SELECT 1 FROM Jugadores_Planetas WHERE jugador_id = 1 AND planeta_id = 3
);

INSERT INTO Jugadores_Planetas (jugador_id, planeta_id)
SELECT * FROM (SELECT 1 AS jugador_id, 6 AS planeta_id) AS tmp
WHERE NOT EXISTS (
    SELECT 1 FROM Jugadores_Planetas WHERE jugador_id = 1 AND planeta_id = 6
);

INSERT INTO Jugadores_Planetas (jugador_id, planeta_id)
SELECT * FROM (SELECT 2 AS jugador_id, 2 AS planeta_id) AS tmp
WHERE NOT EXISTS (
    SELECT 1 FROM Jugadores_Planetas WHERE jugador_id = 2 AND planeta_id = 2
);

INSERT INTO Jugadores_Planetas (jugador_id, planeta_id)
SELECT * FROM (SELECT 2 AS jugador_id, 7 AS planeta_id) AS tmp
WHERE NOT EXISTS (
    SELECT 1 FROM Jugadores_Planetas WHERE jugador_id = 2 AND planeta_id = 7
);

INSERT INTO Jugadores_Planetas (jugador_id, planeta_id)
SELECT * FROM (SELECT 3 AS jugador_id, 8 AS planeta_id) AS tmp
WHERE NOT EXISTS (
    SELECT 1 FROM Jugadores_Planetas WHERE jugador_id = 3 AND planeta_id = 8
);

INSERT INTO Jugadores_Planetas (jugador_id, planeta_id)
SELECT * FROM (SELECT 4 AS jugador_id, 4 AS planeta_id) AS tmp
WHERE NOT EXISTS (
    SELECT 1 FROM Jugadores_Planetas WHERE jugador_id = 4 AND planeta_id = 4
);

INSERT INTO Jugadores_Planetas (jugador_id, planeta_id)
SELECT * FROM (SELECT 4 AS jugador_id, 10 AS planeta_id) AS tmp
WHERE NOT EXISTS (
    SELECT 1 FROM Jugadores_Planetas WHERE jugador_id = 4 AND planeta_id = 10
);

INSERT INTO Jugadores_Planetas (jugador_id, planeta_id)
SELECT * FROM (SELECT 5 AS jugador_id, 5 AS planeta_id) AS tmp
WHERE NOT EXISTS (
    SELECT 1 FROM Jugadores_Planetas WHERE jugador_id = 5 AND planeta_id = 5
);

INSERT INTO Jugadores_Planetas (jugador_id, planeta_id)
SELECT * FROM (SELECT 6 AS jugador_id, 9 AS planeta_id) AS tmp
WHERE NOT EXISTS (
    SELECT 1 FROM Jugadores_Planetas WHERE jugador_id = 6 AND planeta_id = 9
);

-- Asignación de recursos iniciales a los planetas
INSERT INTO Planetas_Recursos (planeta_id, recurso_id, cantidad) VALUES
(1, 1, 500000), (1, 2, 23000), (1, 3, 25000),
(2, 1, 500000), (2, 2, 23000), (2, 3, 25000),
(3, 1, 500000), (3, 2, 23000), (3, 3, 25000),
(4, 1, 500000), (4, 2, 23000), (4, 3, 25000),
(5, 1, 500000), (5, 2, 23000), (5, 3, 25000),
(6, 1, 500000), (6, 2, 23000), (6, 3, 25000),
(7, 1, 500000), (7, 2, 23000), (7, 3, 25000),
(8, 1, 500000), (8, 2, 23000), (8, 3, 25000),
(9, 1, 500000), (9, 2, 23000), (9, 3, 25000),
(10, 1, 500000), (10, 2, 23000), (10, 3, 25000);

-- Asignación de edificios a planetas
INSERT INTO Planetas_Edificios (planeta_id, edificio_id) VALUES
(1, 1), (1, 6), -- Nova Prime: Centro de Investigación, Sintetizador de Deuterio
(2, 5), (2, 7), (2, 8), -- Stellar Haven: Puerto Espacial, Hangar de Naves, Almacén de Metales
(3, 3), (3, 5), -- Astral Oasis: Planta de Energía Solar, Hangar de Naves
(4, 4), (4, 3), -- Celestial Outpost: Defensa Planetaria, Planta de Energía Solar
(5, 5), (5, 1), -- Galactic Citadel: Hangar de Naves, Centro de Investigación
(6, 6), (6, 1), -- Starlight Sanctuary: Sintetizador de Deuterio, Centro de Investigación
(7, 3), (7, 5), -- Celestial Outpost II: Planta de Energía Solar, Hangar de Naves
(8, 1), (8, 8), -- Nebula Nexus: Centro de Investigación, Almacén de Metales
(9, 6), (9, 5), (9, 7), -- Solar Haven: Sintetizador de Deuterio, Puerto Espacial, Hangar de Naves
(10, 3), (10, 1); -- Asteroid Haven: Planta de Energía Solar, Centro de Investigación

-- Asignación de naves a planetas
INSERT INTO Planetas_Naves (planeta_id, nave_id, cantidad) VALUES
(2, 1, 50), (2, 3, 20), (2, 4, 30), -- Stellar Haven
(7, 2, 30), (7, 5, 15), (7, 1, 25), -- Celestial Outpost II
(9, 2, 20), (9, 4, 30), (9, 5, 10); -- Solar Haven

-- Evaluación y creación del edificio de Defensa Planetaria para galactic_ruler
INSERT INTO Planetas_Edificios (planeta_id, edificio_id)
SELECT 2, 4 -- Stellar Haven, Defensa Planetaria
WHERE NOT EXISTS (
    SELECT 1 FROM Planetas_Edificios
    WHERE planeta_id = 2 AND edificio_id = 4
);