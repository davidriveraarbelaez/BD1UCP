# Ejercicios Taller SQL

1. Crear una base de datos llamada biblioteca.
2. Dentro de la base de datos, cree una tabla libros con:
    - id entero, clave primaria autoincremental.
    - titulo texto obligatorio (máximo 150 caracteres).
    - autor texto.
    anio_publicacion entero, mayor o igual a 1900

3. Cree una tabla prestamos que tenga:
    - id entero, clave primaria.
    - libro_id que sea clave foránea a la tabla libros.
    - fecha_prestamo (tipo DATE).
    - fecha_devolucion (tipo DATE).
