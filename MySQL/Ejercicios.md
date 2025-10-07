# Taller corte 2. Primera parte

1. Selección básica (SELECT)

Mostrar el nombre, plataforma y año de lanzamiento de los primeros 10 videojuegos almacenados.

```sql
SELECT Name, Platform, Year_of_Release
FROM games
LIMIT 10;
```

2. Filtrado con WHERE

Obtener todos los videojuegos del género ‘Action’ lanzados después de 2010.

```sql
SELECT Name, Year_of_Release, Genre
FROM games
WHERE Genre = 'Action' AND Year_of_Release > 2010;
SELECT Name, Year_of_Release, Genre
FROM games
WHERE Genre = 'Action' AND Year_of_Release > 2010;
```

3. Ordenamiento (ORDER BY)

Mostrar los 5 juegos más vendidos globalmente, ordenados de mayor a menor venta total.

```sql
SELECT Name, Global_Sales
FROM games
ORDER BY Global_Sales DESC
LIMIT 5;
```

4. Funciones agregadas (COUNT, AVG)
```sql
SELECT COUNT(*) AS total_juegos,
       AVG(Global_Sales) AS promedio_ventas
FROM games;
```

5. Calcular el número total de juegos y la venta promedio global.

```sql
SELECT COUNT(*) AS total_juegos,
       AVG(Global_Sales) AS promedio_ventas
FROM games;
```

6. Agrupamiento (GROUP BY)

Mostrar el total de ventas globales por género, ordenadas de mayor a menor.

```sql
SELECT Genre, SUM(Global_Sales) AS total_ventas
FROM games
GROUP BY Genre
ORDER BY total_ventas DESC;
SELECT Name, Global_Sales
FROM games
ORDER BY Global_Sales DESC
LIMIT 5;
```

7. Funciones agregadas (COUNT, AVG)

Calcular el número total de juegos y la venta promedio global.

```sql
SELECT COUNT(*) AS total_juegos,
       AVG(Global_Sales) AS promedio_ventas
FROM games;
```

8. Agrupamiento (GROUP BY)

Mostrar el total de ventas globales por género, ordenadas de mayor a menor.

```sql
SELECT Genre, SUM(Global_Sales) AS total_ventas
FROM games
GROUP BY Genre
ORDER BY total_ventas DESC;
```