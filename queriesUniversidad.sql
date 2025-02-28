USE universidad;
-- 1 Devuelve un listado con el primer apellido, segundo apellido y el nombre de todos los/as alumnos/as.
-- El listado deberá estar ordenado alfabéticamente de menor a mayor por el primer apellido, segundo apellido y nombre.
SELECT 
    apellido1, apellido2, nombre
FROM
    persona
WHERE
    tipo = 'alumno'
ORDER BY apellido1 ASC , apellido2 ASC , nombre ASC;

-- 2 Averigua el nombre y los dos apellidos de los alumnos que no han dado de alta su número de teléfono en la base de datos.
SELECT 
    nombre, apellido1, apellido2
FROM
    persona
WHERE
    tipo = 'alumno' AND telefono IS NULL;
    
-- 3 Devuelve el listado de los alumnos que nacieron en 1999.
SELECT 
    *
FROM
    persona
WHERE
    tipo = 'alumno'
        AND YEAR(fecha_nacimiento) = 1999;
        
-- 4 Devuelve el listado de profesores/as que no han dado de alta su número de teléfono en la base de datos y además su NIF acaba en K.
SELECT 
    *
FROM
    persona
WHERE
    tipo = 'profesor' AND telefono IS NULL
        AND nif like '%K';
        
-- 5 Devuelve el listado de las asignaturas que se imparten en el primer cuatrimestre,
-- en el tercer curso del grado que tiene el identificador 7.
SELECT 
    *
FROM
    asignatura
WHERE
    cuatrimestre = 1 AND curso = 3
        AND id_grado = 7;

-- 6 Devuelve un listado de los profesores/as junto con el nombre del departamento al que están vinculados.
-- El listado debe devolver cuatro columnas, primer apellido, segundo apellido, nombre y nombre del departamento.
-- El resultado estará ordenado alfabéticamente menor a mayor por los apellidos y el nombre.
SELECT 
    p.apellido1, p.apellido2, p.nombre, d.nombre
FROM
    persona p
        JOIN
    departamento d ON p.id = d.id
WHERE
    p.tipo = 'profesor'
ORDER BY p.apellido1 ASC , p.apellido2 ASC , p.nombre ASC;

-- 7 Devuelve un listado con el nombre de las asignaturas, año de inicio y año de fin del curso escolar del alumno/a con NIF 26902806M.
SELECT 
    a.nombre, ce.anyo_inicio, ce.anyo_fin
FROM
    alumno_se_matricula_asignatura asma
        JOIN
    asignatura a ON asma.id_asignatura = a.id
        JOIN
    curso_escolar ce ON asma.id_curso_escolar = ce.id
        JOIN
    persona p ON asma.id_alumno = p.id
WHERE
    p.nif = '26902806M';

-- 8 Devuelve un listado con el nombre de todos los departamentos que tienen profesores/as que imparten
-- alguna asignatura en el Grado en Ingeniería Informática (Plan 2015).
SELECT 
    d.nombre
FROM
    departamento d
        JOIN
    persona p ON d.id = p.id
        JOIN
    asignatura a ON p.id = a.id_profesor
WHERE
    a.id_grado = 4;

-- 9 Devuelve un listado con todos los alumnos que se han matriculado en alguna asignatura durante el curso escolar 2018/2019.
SELECT 
    p.id, p.nombre, p.apellido1, p.apellido2
FROM
    persona p
        JOIN
    alumno_se_matricula_asignatura asma ON p.id = asma.id_alumno
        JOIN
    curso_escolar ce ON asma.id_curso_escolar = ce.id
WHERE
    ce.id = 5
GROUP BY p.id , p.nombre , p.apellido1 , p.apellido2;

-- Resuelve las 6 siguientes consultas utilizando las cláusulas LEFT JOIN y RIGHT JOIN.

-- 1 Devuelve un listado con los nombres de todos los profesores/as y los departamentos que tienen vinculados.
-- El listado también debe mostrar a aquellos profesores/as que no tienen ningún departamento asociado.
-- El listado debe devolver cuatro columnas, nombre del departamento, primer apellido, segundo apellido y nombre del profesor/a.
-- El resultado estará ordenado alfabéticamente de menor a mayor por el nombre del departamento, apellidos y el nombre.
SELECT 
    d.nombre AS Departamento, p.apellido1, p.apellido2, p.nombre
FROM
    persona p
        LEFT JOIN
    departamento d ON p.id = d.id
WHERE
    p.tipo = 'profesor'
ORDER BY d.nombre ASC , p.apellido1 ASC , p.apellido2 ASC , p.nombre ASC;

-- 2 Devuelve un listado con los profesores/as que no están asociados a un departamento.
SELECT 
    d.nombre AS 'Sin Departamento', p.apellido1, p.apellido2, p.nombre
FROM
    persona p
        LEFT JOIN
    departamento d ON p.id = d.id
WHERE
    p.tipo = 'profesor' AND d.id IS NULL;

-- 3 Devuelve un listado con los departamentos que no tienen profesores/as asociados.
SELECT 
    d.id, d.nombre
FROM
    departamento d
        LEFT JOIN
    profesor p ON d.id = p.id_departamento
WHERE
    p.id_profesor IS NULL;
    
-- 4 Devuelve un listado con los profesores/as que no imparten ninguna asignatura.
SELECT 
    p.apellido1, p.apellido2, p.nombre
FROM
    persona p
        LEFT JOIN
    asignatura a ON p.id = a.id_profesor
WHERE
    p.tipo = 'profesor' AND a.id IS NULL;
    
-- 5 Devuelve un listado con las asignaturas que no tienen un profesor/a asignado.
SELECT 
    a.id, a.nombre
FROM
    asignatura a
        LEFT JOIN
    profesor p ON a.id_profesor = p.id_profesor
WHERE
    a.id_profesor IS NULL;
-- 6 Devuelve un listado con todos los departamentos que no han impartido asignaturas en ningún curso escolar.
SELECT DISTINCT
    d.id, d.nombre
FROM
    departamento d
        LEFT JOIN
    profesor p ON d.id = p.id_departamento
        LEFT JOIN
    asignatura a ON p.id_profesor = a.id_profesor
        LEFT JOIN
    alumno_se_matricula_asignatura asma ON a.id = asma.id_asignatura
GROUP BY d.id , d.nombre
HAVING COUNT(asma.id_curso_escolar) = 0;

-- Consultas resumen:
-- 1 Devuelve el número total de alumnos que hay.
SELECT 
    COUNT(*) AS 'Alumnos totales'
FROM
    persona
WHERE
    tipo = 'alumno';

-- 2 Calcula cuántos alumnos nacieron en 1999.
SELECT 
    COUNT(*) AS 'Alumnos de 1999'
FROM
    persona
WHERE
    tipo = 'alumno'
        AND YEAR(fecha_nacimiento) = 1999;
        
-- 3 Calcula cuántos profesores/as hay en cada departamento. 
-- El resultado sólo tiene que mostrar dos columnas, una con el nombre del departamento y
 -- otra con el número de profesores/as que hay en este departamento. 
 -- El resultado solo debe incluir los departamentos que tienen profesores/as asociados y
 -- deberá estar ordenado de mayor a menor por el número de profesores/as.
SELECT 
    d.nombre AS departamento,
    COUNT(p.id_profesor) AS Número_profesores
FROM
    departamento d
        JOIN
    profesor p ON d.id = p.id_departamento
GROUP BY d.nombre
ORDER BY Número_profesores DESC, d.nombre;
 
-- 4 Devuelve un listado con todos los departamentos y el número de profesores/as que hay en cada uno de ellos.
-- Tenga en cuenta que pueden existir departamentos que no tienen profesores/as asociados.
-- Estos departamentos también deben aparecer en el listado.
SELECT 
    d.nombre AS departamento,
    COUNT(p.id_profesor) AS Número_profesores
FROM
    departamento d
        LEFT JOIN
    profesor p ON  d.id = p.id_departamento
GROUP BY d.id, d.nombre
ORDER BY Número_profesores;

-- 5 Devuelve un listado con el nombre de todos los grados existentes en la base de datos 
-- y el número de asignaturas que tiene cada uno. Ten en cuenta que pueden existir grados
-- que no tienen asignaturas asociadas. Estos grados también deben aparecer en el listado.
-- El resultado deberá estar ordenado de mayor a menor por el número de asignaturas.
SELECT 
    g.nombre AS Grado, COUNT(a.id) AS Número_Asignaturas
FROM
    grado g
        LEFT JOIN
    asignatura a ON g.id = a.id_grado
GROUP BY  g.nombre
ORDER BY Número_Asignaturas DESC, g.nombre;

-- 6 Devuelve un listado con el nombre de todos los grados existentes en la base de datos
-- y el número de asignaturas que tiene cada uno, de los grados que tengan más de 40 asignaturas asociadas.
SELECT 
    g.nombre AS Grado, COUNT(a.id) AS Número_Asignaturas
FROM
    grado g
        LEFT JOIN
    asignatura a ON g.id = a.id_grado
GROUP BY  g.nombre
HAVING COUNT(a.id) > 40;

-- 7 Devuelve un listado que muestre el nombre de los grados y la suma del número total de créditos
-- que hay para cada tipo de asignatura. El resultado debe tener tres columnas: nombre del grado,
-- tipo de asignatura y la suma de los créditos de todas las asignaturas que hay de este tipo.
SELECT 
    g.nombre AS grado,
    a.tipo AS tipo_asignatura,
    SUM(a.creditos) AS total_creditos
FROM
    grado g
        JOIN
    asignatura a ON g.id = a.id_grado
GROUP BY g.nombre , a.tipo;

-- 8 Devuelve un listado que muestre cuántos alumnos se han matriculado de alguna asignatura
-- en cada uno de los cursos escolares. El resultado deberá mostrar dos columnas, una columna
-- con el año de inicio del curso escolar y otra con el número de alumnos matriculados.
SELECT 
    ce.anyo_inicio AS Año_inicio,
    COUNT(asma.id_alumno) AS Número_alumnos
FROM
    curso_escolar ce
       JOIN
    alumno_se_matricula_asignatura asma ON ce.id = asma.id_curso_escolar
GROUP BY ce.anyo_inicio;

-- 9 Devuelve un listado con el número de asignaturas que imparte cada profesor/a.
-- El listado debe tener en cuenta a aquellos profesores/as que no imparten ninguna asignatura.
-- El resultado mostrará cinco columnas: id, nombre, primer apellido, segundo apellido
-- y número de asignaturas. El resultado estará ordenado de mayor a menor por el número de asignaturas.
SELECT 
    p.id, p.nombre, p.apellido1, p.apellido2, COUNT(a.id) AS Número_asignaturas
FROM
    persona p
        LEFT JOIN
    asignatura a ON p.id = a.id_profesor
WHERE
    p.tipo = 'profesor'
GROUP BY p.id , p.nombre , p.apellido1 , p.apellido2
ORDER BY Número_asignaturas DESC;

-- 10 Devuelve todos los datos del alumno/a más joven.
SELECT 
    *
FROM
    persona
WHERE
    persona.tipo = 'alumno'
ORDER BY fecha_nacimiento DESC
LIMIT 1;

-- 11 Devuelve un listado con los profesores/as que tienen un departamento asociado y que no imparten ninguna asignatura.
SELECT 
    p.id, p.nombre, p.apellido1, p.apellido2
FROM
    persona p
        INNER JOIN
    departamento d ON p.id = d.id
        LEFT JOIN
    asignatura a ON p.id = a.id_profesor
WHERE
    p.tipo = 'profesor' AND a.id IS NULL;