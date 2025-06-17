SELECT p.apellido1 AS Primer_apellido, p.apellido2 AS Segundo_apellido, p.nombre AS Nombre
FROM persona p 
WHERE tipo = 'alumno'
ORDER BY p.apellido1 ASC, apellido2 ASC, nombre ASC;

SELECT p.apellido1 AS Primer_apellido, p.apellido2 AS Segundo_apellido, p.nombre AS Nombre
FROM persona p 
WHERE tipo = 'alumno' AND p.telefono IS NULL;

SELECT p.apellido1 AS Primer_apellido, p.apellido2 AS Segundo_apellido, p.nombre AS Nombre
FROM persona p 
WHERE tipo = 'alumno'AND YEAR(fecha_nacimiento) = 1999;

SELECT p.apellido1 AS Primer_apellido, p.apellido2 AS Segundo_apellido, p.nombre AS Nombre
FROM persona p 
WHERE tipo = 'profesor' AND p.telefono IS NULL AND nif LIKE '%K';

SELECT a.nombre AS Nombre_Assignatura
FROM asignatura a 
WHERE cuatrimestre = 1 AND curso = 3 AND id_grado = 7;

SELECT per.apellido1, per.apellido2, per.nombre, dep.nombre AS nombre_departamento
FROM persona per
JOIN profesor prof ON per.id = prof.id_profesor
JOIN departamento dep ON prof.id_departamento = dep.id
WHERE per.tipo = 'profesor'
ORDER BY per.apellido1 ASC, per.apellido2 ASC, per.nombre ASC;

SELECT a.nombre AS asignatura,
       ce.anyo_inicio AS año_inicio,
       ce.anyo_fin AS año_final
FROM persona p
JOIN alumno_se_matricula_asignatura am ON p.id = am.id_alumno
JOIN asignatura a ON am.id_asignatura = a.id
JOIN curso_escolar ce ON am.id_curso_escolar = ce.id
WHERE p.nif = '26902806M';

SELECT DISTINCT d.nombre AS departamento
FROM departamento d
JOIN profesor prof ON d.id = prof.id_departamento
JOIN asignatura a ON prof.id_profesor = a.id_profesor
JOIN grado g ON a.id_grado = g.id
WHERE g.nombre = 'Grado en Ingeniería Informática (Plan 2015)';

SELECT DISTINCT p.nombre, p.apellido1, p.apellido2
FROM alumno_se_matricula_asignatura am
JOIN curso_escolar ce ON ce.id = am.id_curso_escolar
JOIN persona p ON p.id = am.id_alumno
WHERE ce.anyo_inicio = 2018 AND ce.anyo_fin = 2019
  AND p.tipo = 'alumno';
  
  
  
  
  
-- LEFT JOIN i RIGHT JOIN.  
SELECT d.nombre AS departamento,
       p.apellido1 AS primer_apellido,
       p.apellido2 AS segundo_apellido,
       p.nombre AS nombre
FROM profesor prof
LEFT JOIN departamento d ON prof.id_departamento = d.id
JOIN persona p ON p.id = prof.id_profesor
WHERE p.tipo = 'profesor'
ORDER BY d.nombre ASC, p.apellido1 ASC, p.apellido2 ASC, p.nombre ASC;

SELECT p.apellido1 AS primer_apellido,
       p.apellido2 AS segundo_apellido,
       p.nombre AS nombre
FROM persona p
LEFT JOIN profesor prof ON p.id = prof.id_profesor
WHERE p.tipo = 'profesor'
  AND prof.id_departamento IS NULL;

SELECT d.nombre AS Departamento
FROM departamento d
LEFT JOIN profesor prof ON prof.id_departamento = d.id
WHERE prof.id_profesor is NULL;

SELECT p.apellido1 AS primer_apellido,
       p.apellido2 AS segundo_apellido,
       p.nombre AS nombre
FROM persona p
JOIN profesor prof ON prof.id_profesor = p.id
LEFT JOIN asignatura a ON a.id_profesor = prof.id_profesor
WHERE p.tipo = 'profesor' AND a.id IS NULL;

SELECT a.nombre AS Asignatura 
FROM asignatura a
WHERE a.id_profesor IS NULL;

SELECT d.nombre AS departamento
FROM departamento d
LEFT JOIN profesor prof ON d.id = prof.id_departamento
LEFT JOIN asignatura a ON a.id_profesor = prof.id_profesor
LEFT JOIN alumno_se_matricula_asignatura am ON am.id_asignatura = a.id
WHERE am.id_asignatura IS NULL;





-- CONSULTES RESUM:
SELECT COUNT(*) AS total_alumnos
FROM persona
WHERE tipo = 'alumno';

SELECT COUNT(*) AS alumnos_1999
FROM persona
WHERE tipo = 'alumno' AND YEAR(fecha_nacimiento) = 1999;

SELECT d.nombre AS departamento, COUNT(*) AS num_professores
FROM profesor p
JOIN departamento d ON p.id_departamento = d.id
GROUP BY d.nombre
ORDER BY num_professores DESC;

SELECT d.nombre AS departamento, COUNT(p.id_profesor) AS num_profesores
FROM departamento d
LEFT JOIN profesor p ON d.id = p.id_departamento
GROUP BY d.nombre;

SELECT g.nombre AS grado, COUNT(a.id) AS num_assignaturas
FROM grado g
LEFT JOIN asignatura a ON g.id = a.id_grado
GROUP BY g.nombre
ORDER BY num_assignatures DESC;

SELECT g.nombre AS grado, COUNT(a.id) AS num_assignaturas
FROM grado g
LEFT JOIN asignatura a ON g.id = a.id_grado
GROUP BY g.nombre
HAVING COUNT(a.id) > 40
ORDER BY num_assignatures DESC;

SELECT g.nombre AS grado, a.tipo, SUM(a.creditos) AS total_creditos
FROM asignatura a
JOIN grado g ON a.id_grado = g.id
GROUP BY g.nombre, a.tipo;

SELECT ce.anyo_inicio, COUNT(DISTINCT am.id_alumno) AS num_alumnes
FROM curso_escolar ce
JOIN alumno_se_matricula_asignatura am ON ce.id = am.id_curso_escolar
GROUP BY ce.anyo_inicio
ORDER BY ce.anyo_inicio;

SELECT p.id, p.nombre, p.apellido1, p.apellido2, COUNT(a.id) AS num_assignatures
FROM persona p
JOIN profesor prof ON p.id = prof.id_profesor
LEFT JOIN asignatura a ON prof.id_profesor = a.id_profesor
WHERE p.tipo = 'profesor'
GROUP BY p.id, p.nombre, p.apellido1, p.apellido2
ORDER BY num_assignatures DESC;

SELECT *
FROM persona
WHERE tipo = 'alumno'
ORDER BY fecha_nacimiento DESC
LIMIT 1;

SELECT p.nombre, p.apellido1, p.apellido2, d.nombre AS departament
FROM persona p
JOIN profesor prof ON p.id = prof.id_profesor
JOIN departamento d ON prof.id_departamento = d.id
LEFT JOIN asignatura a ON a.id_profesor = prof.id_profesor
WHERE p.tipo = 'profesor' AND a.id IS NULL;




  
  



  










