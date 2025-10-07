## Importar base de datos

1. Copiar el archivo CSV:

```bash
docker cp ./data/games.csv mysql_db:/tmp/games.csv
```

2. Ejecutar el script:

```bash
docker exec -i mysql_db mysql -uroot -proot < importar_games.sql
```

**Posibles errores**

docker exec -i mysql_db mysql -uroot -proot < importar_games.sql
mysql: [Warning] Using a password on the command line interface can be insecure.
ERROR 1290 (HY000) at line 36: The MySQL server is running with the --secure-file-priv option so it cannot execute this statement

docker exec -it mysql_db mysql -uroot -proot -e "SELECT COUNT(*) FROM mydb.steam_games;"

Ejecutar en la terminal:

```bash
docker exec -i mysql_db \
  mysql --local-infile=1 -uroot -proot mydb \
  -e 'LOAD DATA LOCAL INFILE "/tmp/games.csv"
      INTO TABLE steam_games
      CHARACTER SET utf8mb4
      FIELDS TERMINATED BY "," ENCLOSED BY "\""
      LINES TERMINATED BY "\n"
      IGNORE 1 LINES
      (@name, @release_date, @price, @positive, @negative, @app_id, @min_owners, @max_owners, @hltb_single)
      SET
        name         = NULLIF(@name, ""),
        release_date = STR_TO_DATE(@release_date, "%b %e, %Y"),
        price        = NULLIF(@price, ""),
        positive     = NULLIF(@positive, ""),
        negative     = NULLIF(@negative, ""),
        app_id       = NULLIF(@app_id, ""),
        min_owners   = NULLIF(@min_owners, ""),
        max_owners   = NULLIF(@max_owners, ""),
        hltb_single  = NULLIF(@hltb_single, "");'
```


3. Verificar registros:

```bash 
docker exec -it mysql_db mysql -uroot -proot -e "SELECT COUNT(*) FROM mydb.steam_games;"
```