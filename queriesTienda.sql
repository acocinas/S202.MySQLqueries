USE tienda;
-- 1 Lista el nombre de todos los productos que hay en la tabla producto.
SELECT 
    nombre
FROM
    producto;
    
    -- 2 Lista los nombres y los precios de todos los productos de la tabla producto.
SELECT 
    nombre, precio
FROM
    producto;
    
    -- 3 Lista todas las columnas de la tabla.
SELECT 
    *
FROM
    producto;
    
	-- 4 Lista el nombre de los productos, el precio en euros y el precio en dólares estadounidenses (USD)
SELECT 
    nombre,
    CONCAT(precio, '€') AS euros,
    CONCAT(ROUND(precio * 1.1, 2), '$') AS dolars
FROM
    producto;
 
   -- 5 Lista el nombre de los productos, el precio en euros y el precio en dólares estadounidenses (USD).
SELECT 
    nombre AS nombre_producto,
    CONCAT(precio, '€') AS euros,
    CONCAT(ROUND(precio * 1.1, 2), '$') AS dolars
FROM
    producto;
    
 -- 6 Lista los nombres y los precios de todos los productos de la tabla, convirtiendo los nombres a mayúscula.
SELECT 
    UPPER(nombre), precio
FROM
    producto;
   
 -- 7 Lista los nombres y los precios de todos los productos de la tabla, convirtiendo los nombres a minúscula.
SELECT 
    LOWER(nombre), precio
FROM
    producto;
   
-- 8 Lista el nombre de todos los fabricantes en una columna, y en otra columna obtenga en mayúsculas los
   -- dos primeros caracteres del nombre del fabricante.
SELECT 
    nombre, UPPER(LEFT(nombre, 2))
FROM
    fabricante;
    
    -- 9 Lista los nombres y los precios de todos los productos de la tabla producto, redondeando el valor del precio.
SELECT 
    nombre, ROUND(precio, 0) AS precio
FROM
    producto;
    
 -- 10 Lista los nombres y los precios de todos los productos de la tabla, truncando el valor del precio para
SELECT 
    nombre, TRUNCATE(precio, 0)
FROM
    producto;
    
 -- 11 Lista el código de los fabricantes que tienen productos en la tabla producto.
SELECT 
    codigo_fabricante
FROM
    producto;
    
-- 12 Lista el código de los fabricantes que tienen productos en la tabla producto, eliminando los códigos
    -- que aparecen repetidos.
 SELECT DISTINCT
    codigo_fabricante
FROM
    producto;
    
-- 13 Lista los nombres de los fabricantes ordenados de manera ascendente.
select nombre from fabricante ORDER BY nombre ASC;

-- 14 Lista los nombres de los fabricantes ordenados de manera descendente.
select nombre from fabricante order by nombre DESC;

-- 15 Lista los nombres de los productos ordenados, en primer lugar, por el nombre de manera ascendente y,
-- en segundo lugar, por el precio de manera descendente. 
-- Entendiendo que piden una lista con los productos ordenados dos veces de distintas maneras
SELECT nombre, precio, 'orden alfabético' AS tipo_orden
FROM producto

UNION ALL

SELECT nombre, precio, 'orden precio' AS tipo_orden
FROM producto

ORDER BY tipo_orden, 
         CASE WHEN tipo_orden = 'orden alfabético' THEN nombre END ASC,
         CASE WHEN tipo_orden = 'orden precio' THEN precio END DESC;
-- Entendiendo que piden una lista con los productos ordenados alfabeticamente y si hay 2 iguales por precio descendente
SELECT 
    nombre, precio
FROM
    producto
ORDER BY nombre ASC , precio DESC;

-- 16 Devuelve una lista con las 5 primeras filas de la tabla fabricante.
 SELECT 
    *
FROM
    fabricante
LIMIT 5;

-- 17 Devuelve una lista con 2 filas a partir de la cuarta fila de la tabla fabricante. 
-- La cuarta fila también debe incluirse en la respuesta.
SELECT 
    *
FROM
    fabricante
LIMIT 2 OFFSET 3;

-- 18 Lista el nombre y el precio del producto más barato. (Utiliza solamente las cláusulas ORDER BY y LIMIT). 
-- NOTA: Aquí no podría usar MIN(precio), necesitaría GROUP BY.
SELECT 
    *
FROM
    producto
ORDER BY precio ASC
LIMIT 1;

-- 19 Lista el nombre y el precio del producto más caro. (Utiliza solamente las cláusulas ORDER BY y LIMIT).
-- NOTA: Aquí no podría usar MAX(precio), necesitaría GROUP BY.
SELECT 
    *
FROM
    producto
ORDER BY precio DESC
LIMIT 1;

-- 20 Lista el nombre de todos los productos del fabricante cuyo código de fabricante es igual a 2.
SELECT 
    nombre
FROM
    producto
WHERE
    codigo_fabricante = 2;

-- 21 Devuelve una lista con el nombre del producto, precio y nombre de fabricante
-- de todos los productos de la base de datos.
SELECT 
    producto.nombre, producto.precio, fabricante.nombre
FROM
    producto
        JOIN
    fabricante ON producto.codigo_fabricante = fabricante.codigo;
    
-- 22 Devuelve una lista con el nombre del producto, precio y nombre de fabricante de todos los productos de la base de datos.
--  Ordena el resultado por el nombre del fabricante, por orden alfabético.
SELECT 
    producto.nombre, producto.precio, fabricante.nombre
FROM
    producto
        JOIN
    fabricante ON producto.codigo_fabricante = fabricante.codigo
ORDER BY fabricante.nombre ASC;

-- 23 Devuelve una lista con el código del producto, nombre del producto, código del fabricante y nombre del fabricante,
-- de todos los productos de la base de datos.
SELECT 
   producto.codigo, producto.nombre,  fabricante.codigo, fabricante.nombre
FROM
    producto
        JOIN
    fabricante ON producto.codigo_fabricante = fabricante.codigo;

-- 24 Devuelve el nombre del producto, su precio y el nombre de su fabricante, del producto más barato.
SELECT 
    producto.nombre, producto.precio, fabricante.nombre
FROM
    producto
        JOIN
    fabricante ON producto.codigo_fabricante = fabricante.codigo
ORDER BY precio ASC
LIMIT 1;

-- 25 Devuelve el nombre del producto, su precio y el nombre de su fabricante, del producto más caro.
SELECT 
    producto.nombre, producto.precio, fabricante.nombre
FROM
    producto
        JOIN
    fabricante ON producto.codigo_fabricante = fabricante.codigo
ORDER BY precio DESC
LIMIT 1;

-- 26 Devuelve una lista de todos los productos del fabricante Lenovo.
SELECT 
    producto.nombre
FROM
    producto
        JOIN
    fabricante ON producto.codigo_fabricante = fabricante.codigo
WHERE
    fabricante.nombre = 'lenovo';
    
-- 27 Devuelve una lista de todos los productos del fabricante Crucial que tengan un precio mayor que 200 €.
SELECT 
    producto.nombre, producto.precio, fabricante.nombre
FROM
    producto
        JOIN
    fabricante ON producto.codigo_fabricante = fabricante.codigo
WHERE
    fabricante.nombre = 'crucial' AND producto.precio >200;
-- 28 Devuelve un listado con todos los productos de los fabricantes Asus, Hewlett-Packardy Seagate. Sin utilizar el operador IN.
SELECT 
    producto.nombre, producto.precio, fabricante.nombre
FROM
    producto
        JOIN
    fabricante ON producto.codigo_fabricante = fabricante.codigo
WHERE
    fabricante.nombre = 'Asus'
        OR fabricante.nombre = 'Hewlett-Packard'
        OR fabricante.nombre = 'Seagate';
        
-- 29 Devuelve un listado con todos los productos de los fabricantes Asus, Hewlett-Packardy Seagate. Usando el operador IN.
SELECT 
    producto.nombre, producto.precio, fabricante.nombre
FROM
    producto
        JOIN
    fabricante ON producto.codigo_fabricante = fabricante.codigo
WHERE
    fabricante.nombre IN ('Asus' , 'Hewlett-Packard', 'Seagate');
    
-- 30 Devuelve un listado con el nombre y el precio de todos los productos de los fabricantes cuyo nombre acabe por la vocal e.
SELECT 
    producto.nombre, producto.precio, fabricante.nombre
FROM
    producto
        JOIN
    fabricante ON producto.codigo_fabricante = fabricante.codigo
WHERE
    fabricante.nombre LIKE '%e';
    
-- 31 Devuelve un listado con el nombre y el precio de todos los productos cuyo nombre de fabricante contenga el carácter w en su nombre.
SELECT 
    producto.nombre, producto.precio, fabricante.nombre
FROM
    producto
        JOIN
    fabricante ON producto.codigo_fabricante = fabricante.codigo
WHERE
    fabricante.nombre LIKE '%w%';
-- 32 Devuelve un listado con el nombre de producto, precio y nombre de fabricante, de todos los productos que tengan un precio mayor o igual a 180 €. 
-- Ordena el resultado, en primer lugar, por el precio (en orden descendente) y, en segundo lugar, por el nombre (en orden ascendente).
SELECT 
    producto.nombre, producto.precio, fabricante.nombre
FROM
    producto
        JOIN
    fabricante ON producto.codigo_fabricante = fabricante.codigo
WHERE
    producto.precio > 180
ORDER BY producto.precio DESC , producto.nombre ASC;
    
-- 33 Devuelve un listado con el código y el nombre de fabricante, solamente de aquellos 
-- fabricantes que tienen productos asociados en la base de datos.
SELECT DISTINCT
    fabricante.codigo, fabricante.nombre
FROM
    producto
        JOIN
    fabricante ON producto.codigo_fabricante = fabricante.codigo;

-- 34 Devuelve un listado de todos los fabricantes que existen en la base de datos, junto con los productos que tiene cada uno de ellos.
-- El listado deberá mostrar también aquellos fabricantes que no tienen productos asociados.
SELECT 
    fabricante.codigo, fabricante.nombre, producto.nombre, producto.precio
FROM
    fabricante
       LEFT JOIN
    producto ON fabricante.codigo = producto.codigo_fabricante; 
    
-- 35 Devuelve un listado donde sólo aparezcan aquellos fabricantes que no tienen ningún producto asociado.
SELECT 
    fabricante.codigo, fabricante.nombre
FROM
    fabricante
       LEFT JOIN
    producto ON fabricante.codigo = producto.codigo_fabricante
    WHERE 
    producto.codigo IS NULL; 

-- 36 Devuelve todos los productos del fabricante Lenovo. (Sin utilizar INNER JOIN).
SELECT 
    producto.nombre
FROM
    producto
        JOIN
    fabricante ON producto.codigo_fabricante = fabricante.codigo
WHERE
    fabricante.nombre = 'lenovo';
-- 37 Devuelve todos los datos de los productos que tienen el mismo precio que el producto más caro del fabricante Lenovo. (Sin usar INNER JOIN).
SELECT 
    * 
FROM
    producto
WHERE
    precio = (SELECT 
            MAX(precio)
        FROM
            producto, fabricante
        WHERE
            producto.codigo_fabricante = fabricante.codigo
                AND fabricante.nombre = 'Lenovo');
                
-- 38 Lista el nombre del producto más caro del fabricante Lenovo.
SELECT 
    *
FROM
    producto
        JOIN
    fabricante ON producto.codigo_fabricante = fabricante.codigo
WHERE
    fabricante.nombre = 'lenovo'
ORDER BY producto.precio DESC
LIMIT 1;

-- 39 Lista el nombre del producto más barato del fabricante Hewlett-Packard.
SELECT 
    *
FROM
    producto
        JOIN
    fabricante ON producto.codigo_fabricante = fabricante.codigo
WHERE
    fabricante.nombre = 'Hewlett-Packard'
ORDER BY producto.precio ASC
LIMIT 1;

-- 40 Devuelve todos los productos de la base de datos que tienen un precio mayor o igual al producto más caro del fabricante Lenovo.
SELECT 
    * 
FROM
    producto
WHERE
    precio >= (SELECT 
            MAX(precio)
        FROM
            producto, fabricante
        WHERE
            producto.codigo_fabricante = fabricante.codigo
                AND fabricante.nombre = 'Lenovo');
                
-- 41 Lista todos los productos del fabricante Asus que tienen un precio superior al precio medio de todos sus productos.
SELECT producto.nombre, producto.precio 
FROM producto
JOIN fabricante
    ON producto.codigo_fabricante = fabricante.codigo
WHERE fabricante.nombre = 'Asus' 
AND producto.precio > (
    SELECT AVG(precio)
    FROM producto
    INNER JOIN fabricante
        ON producto.codigo_fabricante = fabricante.codigo
    WHERE fabricante.nombre = 'Asus'
);