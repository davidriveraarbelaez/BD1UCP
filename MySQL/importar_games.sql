-- ======================================================================================================================
-- Descripción: Crea la base de datos, la tabla steam_games e importa los datos desde el archivo games.csv
-- ======================================================================================================================

-- 1. Crear base de datos
CREATE DATABASE IF NOT EXISTS mydb
  CHARACTER SET utf8mb4
  COLLATE utf8mb4_unicode_ci;

USE mydb;

-- 2. Crear tabla steam_games
DROP TABLE IF EXISTS steam_games;
CREATE TABLE steam_games (
  app_id       INT UNSIGNED NOT NULL,
  name         VARCHAR(255) NOT NULL,
  release_date DATE NULL,
  price        DECIMAL(8,2) NULL,
  positive     INT UNSIGNED NULL,
  negative     INT UNSIGNED NULL,
  min_owners   INT UNSIGNED NULL,
  max_owners   INT UNSIGNED NULL,
  hltb_single  DECIMAL(8,2) NULL,
  PRIMARY KEY (app_id),
  INDEX idx_release_date (release_date),
  INDEX idx_price (price)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 3. Cargar datos desde el CSV
--  Revisar que se halla copiado el archivo al contenedor:
--     docker cp ./MySQL/data/games.csv mysql_db:/tmp/games.csv
--
--  Se requiere que MySQL tenga activado local_infile:
--     SHOW VARIABLES LIKE 'local_infile';

LOAD DATA INFILE '/tmp/games.csv'
INTO TABLE steam_games
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ',' ENCLOSED BY '"' 
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(@name, @release_date, @price, @positive, @negative, @app_id, @min_owners, @max_owners, @hltb_single)
SET
  name         = NULLIF(@name, ''),
  release_date = STR_TO_DATE(@release_date, '%b %e, %Y'),
  price        = NULLIF(@price, ''),
  positive     = NULLIF(@positive, ''),
  negative     = NULLIF(@negative, ''),
  app_id       = NULLIF(@app_id, ''),
  min_owners   = NULLIF(@min_owners, ''),
  max_owners   = NULLIF(@max_owners, ''),
  hltb_single  = NULLIF(@hltb_single, '');

-- 4️. Verificar la importación
SELECT COUNT(*) AS total_registros FROM steam_games;
SELECT name, price, release_date FROM steam_games LIMIT 10;
