## Importar base de datos

1. Copiar el archivo CSV:

```bash
docker cp ./data/games.csv mysql_db:/tmp/games.csv
```

2. Ejecutar el script:

```bash
docker exec -i mysql_db mysql -uroot -proot < importar_games.sql
```

3. Verificar registros:

```bash 
docker exec -it mysql_db mysql -uroot -proot -e "SELECT COUNT(*) FROM mydb.steam_games;"
```