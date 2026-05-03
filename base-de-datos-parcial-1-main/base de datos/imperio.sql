-- Script SQL generado para cumplir con las consignas del parcial

CREATE DATABASE IF NOT EXISTS Imperio;
USE Imperio;

DROP TABLE IF EXISTS Planetas_Armamentos;
DROP TABLE IF EXISTS Planetas_Edificios;
DROP TABLE IF EXISTS Planetas_Naves;
DROP TABLE IF EXISTS Planetas_Recursos;
DROP TABLE IF EXISTS Lunas;
DROP TABLE IF EXISTS Edificios;
DROP TABLE IF EXISTS Armamentos;
DROP TABLE IF EXISTS Naves;
DROP TABLE IF EXISTS Recursos;
DROP TABLE IF EXISTS Planetas;
DROP TABLE IF EXISTS Galaxias;
DROP TABLE IF EXISTS Jugadores;

CREATE TABLE Jugadores (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(100) NOT NULL,
    email VARCHAR(150) NOT NULL,
    password VARCHAR(100) NOT NULL,
    fecha_registro DATE NOT NULL
);

CREATE TABLE Galaxias (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    sector VARCHAR(50) NOT NULL
);

CREATE TABLE Planetas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    coordenadaX INT NOT NULL,
    coordenadaY INT NOT NULL,
    superficie INT NOT NULL,
    id_galaxia INT NOT NULL,
    jugador_id INT NOT NULL,
    FOREIGN KEY (id_galaxia) REFERENCES Galaxias(id),
    FOREIGN KEY (jugador_id) REFERENCES Jugadores(id)
);

CREATE TABLE Recursos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);

CREATE TABLE Naves (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    costo_metal INT NOT NULL,
    costo_cristal INT NOT NULL,
    costo_energia INT NOT NULL
);

CREATE TABLE Armamentos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    costo_metal INT NOT NULL,
    costo_cristal INT NOT NULL,
    costo_energia INT NOT NULL
);

CREATE TABLE Edificios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(120) NOT NULL,
    costo_metal INT NOT NULL,
    costo_cristal INT NOT NULL,
    costo_energia INT NOT NULL
);

CREATE TABLE Lunas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    superficie INT NOT NULL,
    planeta_id INT NOT NULL,
    FOREIGN KEY (planeta_id) REFERENCES Planetas(id)
);

CREATE TABLE Planetas_Recursos (
    planeta_id INT NOT NULL,
    recurso_id INT NOT NULL,
    cantidad INT NOT NULL,
    PRIMARY KEY (planeta_id, recurso_id),
    FOREIGN KEY (planeta_id) REFERENCES Planetas(id),
    FOREIGN KEY (recurso_id) REFERENCES Recursos(id)
);

CREATE TABLE Planetas_Naves (
    planeta_id INT NOT NULL,
    nave_id INT NOT NULL,
    cantidad INT NOT NULL,
    PRIMARY KEY (planeta_id, nave_id),
    FOREIGN KEY (planeta_id) REFERENCES Planetas(id),
    FOREIGN KEY (nave_id) REFERENCES Naves(id)
);

CREATE TABLE Planetas_Edificios (
    planeta_id INT NOT NULL,
    edificio_id INT NOT NULL,
    nivel INT NOT NULL DEFAULT 1,
    PRIMARY KEY (planeta_id, edificio_id),
    FOREIGN KEY (planeta_id) REFERENCES Planetas(id),
    FOREIGN KEY (edificio_id) REFERENCES Edificios(id)
);

CREATE TABLE Planetas_Armamentos (
    planeta_id INT NOT NULL,
    armamento_id INT NOT NULL,
    cantidad INT NOT NULL,
    PRIMARY KEY (planeta_id, armamento_id),
    FOREIGN KEY (planeta_id) REFERENCES Planetas(id),
    FOREIGN KEY (armamento_id) REFERENCES Armamentos(id)
);

-- Parte 2: Inserción de datos
INSERT INTO Jugadores (username, email, password, fecha_registro) VALUES
('astro_gamer', 'astro_gamer@email.com', 'estelar123', '2024-02-18'),
('galactic_ruler', 'ruler@galaxy.com', 'ruler567', '2024-02-18'),
('cosmic_explorer', 'explorer@universe.com', 'explore321', '2024-02-18'),
('space_commander', 'commander@space.com', 'command789', '2024-02-18'),
('stargazer', 'stargazer@gmail.com', 'star1234', '2024-02-18'),
('space_pioneer', 'pioneer@email.com', 'pioneer123', '2024-02-18');

INSERT INTO Galaxias (nombre, sector) VALUES
('Milky Way', 'Alpha'),
('Andromeda', 'Beta'),
('Pegasus', 'Gamma'),
('Orion', 'Delta'),
('Centaurus', 'Epsilon');

INSERT INTO Planetas (nombre, coordenadaX, coordenadaY, superficie, id_galaxia, jugador_id) VALUES
(
    'Nova Prime', 10, 20, 108728,
    (SELECT id FROM Galaxias WHERE nombre = 'Milky Way'),
    (SELECT id FROM Jugadores WHERE username = 'astro_gamer')
),
(
    'Stellar Haven', 15, 25, 4884,
    (SELECT id FROM Galaxias WHERE nombre = 'Andromeda'),
    (SELECT id FROM Jugadores WHERE username = 'galactic_ruler')
),
(
    'Astral Oasis', 8, 30, 142984,
    (SELECT id FROM Galaxias WHERE nombre = 'Milky Way'),
    (SELECT id FROM Jugadores WHERE username = 'astro_gamer')
),
(
    'Celestial Outpost', 12, 18, 9452,
    (SELECT id FROM Galaxias WHERE nombre = 'Pegasus'),
    (SELECT id FROM Jugadores WHERE username = 'space_commander')
),
(
    'Galactic Citadel', 25, 15, 51118,
    (SELECT id FROM Galaxias WHERE nombre = 'Orion'),
    (SELECT id FROM Jugadores WHERE username = 'stargazer')
),
(
    'Starlight Sanctuary', 5, 12, 7534,
    (SELECT id FROM Galaxias WHERE nombre = 'Milky Way'),
    (SELECT id FROM Jugadores WHERE username = 'astro_gamer')
),
(
    'Celestial Outpost II', 18, 22, 49532,
    (SELECT id FROM Galaxias WHERE nombre = 'Andromeda'),
    (SELECT id FROM Jugadores WHERE username = 'galactic_ruler')
),
(
    'Nebula Nexus', 30, 8, 6794,
    (SELECT id FROM Galaxias WHERE nombre = 'Pegasus'),
    (SELECT id FROM Jugadores WHERE username = 'cosmic_explorer')
),
(
    'Solar Haven', 10, 30, 12756,
    (SELECT id FROM Galaxias WHERE nombre = 'Milky Way'),
    (SELECT id FROM Jugadores WHERE username = 'space_pioneer')
),
(
    'Asteroid Haven', 22, 17, 12104,
    (SELECT id FROM Galaxias WHERE nombre = 'Orion'),
    (SELECT id FROM Jugadores WHERE username = 'space_commander')
);

INSERT INTO Lunas (nombre, superficie, planeta_id) VALUES
('Luminara', 1524, 1),
('Nightshade', 1289, 2),
('Galaxysong', 1811, 3),
('StellarDust', 2037, 4),
('MoonlightGrove', 1699, 5),
('GlimmeringOrbit', 1387, 1),
('EclipseHarbor', 1114, 2),
('MoonstoneMeadow', 1532, 3),
('StellarRefuge', 1844, 4),
('CosmicSerenity', 1656, 5),
('Luminara II', 1457, 6),
('Nightshade II', 1228, 7),
('Galaxysong II', 1791, 8),
('StellarDust II', 2033, 9),
('MoonlightGrove II', 1578, 10);

INSERT INTO Naves (nombre, costo_metal, costo_cristal, costo_energia) VALUES
('Caza Estelar', 100, 50, 30),
('Destructor Interplanetario', 200, 100, 150),
('Nave de Colonización', 150, 80, 100),
('Transportador de Recursos', 80, 120, 50),
('Nave de Exploración', 120, 70, 90);

INSERT INTO Recursos (nombre) VALUES
('Metal'),
('Deuterio'),
('Energía');

INSERT INTO Armamentos (nombre, costo_metal, costo_cristal, costo_energia) VALUES
('Cañón de Plasma', 150, 100, 80),
('Torreta de Defensa', 100, 80, 120),
('Láser de Precisión', 120, 150, 100),
('Bomba de Neutrinos', 80, 120, 150),
('Escudo de Energía', 100, 150, 80);

INSERT INTO Edificios (nombre, costo_metal, costo_cristal, costo_energia) VALUES
('Centro de Investigación', 500, 200, 300),
('Hangar de Naves', 300, 400, 200),
('Planta de Energía Solar', 200, 300, 500),
('Defensa Planetaria', 400, 200, 300),
('Puerto Espacial', 300, 500, 200),
('Sintetizador de Deuterio', 250, 400, 150),
('Almacén de Metales', 150, 250, 100);

-- Parte 3: Querys
-- 1) Asignación de planetas a jugadores (1:N, sin tabla pivote)
UPDATE Planetas p
JOIN Jugadores j ON (
    (j.username = 'astro_gamer' AND p.nombre IN ('Nova Prime', 'Astral Oasis', 'Starlight Sanctuary'))
    OR (j.username = 'galactic_ruler' AND p.nombre IN ('Stellar Haven', 'Celestial Outpost II'))
    OR (j.username = 'cosmic_explorer' AND p.nombre IN ('Nebula Nexus'))
    OR (j.username = 'space_commander' AND p.nombre IN ('Celestial Outpost', 'Asteroid Haven'))
    OR (j.username = 'stargazer' AND p.nombre IN ('Galactic Citadel'))
    OR (j.username = 'space_pioneer' AND p.nombre IN ('Solar Haven'))
)
SET p.jugador_id = j.id;

-- 2) Recursos iniciales para todos los planetas
INSERT INTO Planetas_Recursos (planeta_id, recurso_id, cantidad)
SELECT p.id,
       r.id,
       CASE r.nombre
           WHEN 'Metal' THEN 500000
           WHEN 'Deuterio' THEN 23000
           WHEN 'Energía' THEN 25000
           ELSE 0
       END AS cantidad
FROM Planetas p
CROSS JOIN Recursos r
WHERE NOT EXISTS (
    SELECT 1
    FROM Planetas_Recursos pr
    WHERE pr.planeta_id = p.id AND pr.recurso_id = r.id
);

-- 3) Asignación de edificios por planeta
INSERT INTO Planetas_Edificios (planeta_id, edificio_id)
SELECT p.id, e.id
FROM Planetas p
JOIN Edificios e ON (
    (p.nombre = 'Nova Prime' AND e.nombre IN ('Centro de Investigación', 'Sintetizador de Deuterio'))
    OR (p.nombre = 'Stellar Haven' AND e.nombre IN ('Puerto Espacial', 'Hangar de Naves', 'Almacén de Metales'))
    OR (p.nombre = 'Astral Oasis' AND e.nombre IN ('Planta de Energía Solar', 'Hangar de Naves'))
    OR (p.nombre = 'Celestial Outpost' AND e.nombre IN ('Defensa Planetaria', 'Planta de Energía Solar'))
    OR (p.nombre = 'Galactic Citadel' AND e.nombre IN ('Hangar de Naves', 'Centro de Investigación'))
    OR (p.nombre = 'Starlight Sanctuary' AND e.nombre IN ('Sintetizador de Deuterio', 'Centro de Investigación'))
    OR (p.nombre = 'Celestial Outpost II' AND e.nombre IN ('Planta de Energía Solar', 'Hangar de Naves'))
    OR (p.nombre = 'Nebula Nexus' AND e.nombre IN ('Centro de Investigación', 'Almacén de Metales'))
    OR (p.nombre = 'Solar Haven' AND e.nombre IN ('Sintetizador de Deuterio', 'Puerto Espacial', 'Hangar de Naves'))
    OR (p.nombre = 'Asteroid Haven' AND e.nombre IN ('Planta de Energía Solar', 'Centro de Investigación'))
)
WHERE NOT EXISTS (
    SELECT 1
    FROM Planetas_Edificios pe
    WHERE pe.planeta_id = p.id AND pe.edificio_id = e.id
);

-- 4) Asignación de naves
INSERT INTO Planetas_Naves (planeta_id, nave_id, cantidad)
SELECT p.id,
       n.id,
       CASE
           WHEN p.nombre = 'Stellar Haven' AND n.nombre = 'Caza Estelar' THEN 50
           WHEN p.nombre = 'Stellar Haven' AND n.nombre = 'Nave de Colonización' THEN 20
           WHEN p.nombre = 'Stellar Haven' AND n.nombre = 'Transportador de Recursos' THEN 30
           WHEN p.nombre = 'Celestial Outpost II' AND n.nombre = 'Destructor Interplanetario' THEN 30
           WHEN p.nombre = 'Celestial Outpost II' AND n.nombre = 'Nave de Exploración' THEN 15
           WHEN p.nombre = 'Celestial Outpost II' AND n.nombre = 'Caza Estelar' THEN 25
           WHEN p.nombre = 'Solar Haven' AND n.nombre = 'Destructor Interplanetario' THEN 20
           WHEN p.nombre = 'Solar Haven' AND n.nombre = 'Transportador de Recursos' THEN 30
           WHEN p.nombre = 'Solar Haven' AND n.nombre = 'Nave de Exploración' THEN 10
           ELSE NULL
       END AS cantidad
FROM Planetas p
JOIN Naves n ON (
    (p.nombre = 'Stellar Haven' AND n.nombre IN ('Caza Estelar', 'Nave de Colonización', 'Transportador de Recursos'))
    OR (p.nombre = 'Celestial Outpost II' AND n.nombre IN ('Destructor Interplanetario', 'Nave de Exploración', 'Caza Estelar'))
    OR (p.nombre = 'Solar Haven' AND n.nombre IN ('Destructor Interplanetario', 'Transportador de Recursos', 'Nave de Exploración'))
)
WHERE NOT EXISTS (
    SELECT 1
    FROM Planetas_Naves pn
    WHERE pn.planeta_id = p.id AND pn.nave_id = n.id
);

-- 5) Defensa Planetaria para galactic_ruler (subconsulta + verificación)
INSERT INTO Planetas_Edificios (planeta_id, edificio_id)
SELECT p.id, e.id
FROM Planetas p
JOIN Jugadores j ON p.jugador_id = j.id
CROSS JOIN Edificios e
WHERE j.username = 'galactic_ruler'
  AND p.nombre = 'Stellar Haven'
  AND e.nombre = 'Defensa Planetaria'
  AND NOT EXISTS (
      SELECT 1
      FROM Planetas_Edificios pe
      WHERE pe.planeta_id = p.id AND pe.edificio_id = e.id
  );
