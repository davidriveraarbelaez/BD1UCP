# Consultas SQL

## Introducción
Las consultas SQL (Structured Query Language) son instrucciones utilizadas para interactuar con bases de datos relacionales. Permiten realizar diversas operaciones, como recuperar, insertar, actualizar y eliminar datos. A continuación, se presentan algunos conceptos y ejemplos básicos de consultas SQL.

## Tipos de Consultas SQL
1. **SELECT**: Se utiliza para recuperar datos de una o más tablas.
   ```sql
   SELECT columna1, columna2 FROM tabla WHERE condición;
   ```
    Ejemplo:
    ```sql
    SELECT nombre, edad FROM empleados WHERE edad > 30;
    ```
2. **INSERT**: Se utiliza para agregar nuevos registros a una tabla.
   ```sql
    INSERT INTO tabla (columna1, columna2) VALUES (valor1, valor2);
    ```
     Ejemplo:
     ```sql
     INSERT INTO empleados (nombre, edad) VALUES ('Juan', 28);
     ```
3. **UPDATE**: Se utiliza para modificar registros existentes en una tabla.
   ```sql
    UPDATE tabla SET columna1 = valor1 WHERE condición;
    ```
     Ejemplo:
     ```sql
     UPDATE empleados SET edad = 29 WHERE nombre = 'Juan';
     ```
4. **DELETE**: Se utiliza para eliminar registros de una tabla.

    ```sql
     DELETE FROM tabla WHERE condición;
     ```
      Ejemplo:
      ```sql
      DELETE FROM empleados WHERE nombre = 'Juan';
      ```
## Operadores Comunes
- **AND**: Combina múltiples condiciones y devuelve verdadero si todas son verdaderas.
- **OR**: Combina múltiples condiciones y devuelve verdadero si al menos una es verdadera.
- **LIKE**: Se utiliza para buscar un patrón específico en una columna.
- **IN**: Se utiliza para especificar múltiples valores en una condición.
- **BETWEEN**: Se utiliza para filtrar los resultados dentro de un rango específico.
## Funciones Agregadas
- **COUNT()**: Cuenta el número de filas que coinciden con una condición.
- **SUM()**: Suma los valores de una columna específica.
- **AVG()**: Calcula el promedio de los valores de una columna.
- **MAX()**: Devuelve el valor máximo de una columna.
- **MIN()**: Devuelve el valor mínimo de una columna.
## Ejemplo Completo
```sql
SELECT nombre, edad, COUNT(*) AS total_empleados
FROM empleados
WHERE edad > 25
GROUP BY nombre, edad
HAVING COUNT(*) > 1
ORDER BY edad DESC;
```

Este ejemplo recupera los nombres y edades de los empleados mayores de 25 años, agrupa los resultados por nombre y edad, filtra aquellos con más de un registro, y ordena los resultados por edad en orden descendente.
