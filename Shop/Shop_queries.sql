-- 1 Llista el nom de tots els productes que hi ha en la taula producto.
SELECT name AS product_name
FROM product;

-- 2 Llista els noms i els preus de tots els productes de la taula producto.
SELECT name AS product_name, price AS product_price
FROM product;

-- 3 Llista totes les columnes de la taula producto.
SELECT *
FROM product;

-- 4 Llista el nom dels productes, el preu en euros i el preu en dòlars estatunidencs (USD).
SELECT name AS product_name,
price AS euros,
price * 1.10 AS dolars
FROM product;

-- 5 Llista el nom dels productes, el preu en euros i el preu en dòlars estatunidencs (USD). Utilitza els següents àlies per a les columnes: nom de producto, euros, dòlars.
SELECT
name AS product_name,
price AS euros,
price * 1.10 AS dolars
FROM product;

-- 6 Llista els noms i els preus de tots els productes de la taula producto, convertint els noms a majúscula.
SELECT
UPPER(name) AS Upper_name,
price AS preu
FROM product;

--7 Llista els noms i els preus de tots els productes de la taula producto, convertint els noms a minúscula.
SELECT
LOWER(name) AS Upper_name,
price AS preu
FROM product;

-- 8 Llista el nom de tots els fabricants en una columna, i en una altra columna obtingui en majúscules els dos primers caràcters del nom del fabricant.
SELECT
name AS manufacturer_name,
UPPER (SUBSTRING(name FROM 1 FOR 2)) AS Initials_name
FROM manufacturer;

-- 9 Llista els noms i els preus de tots els productes de la taula producto, arrodonint el valor del preu.
SELECT
name,
ROUND(price) AS round_price
FROM product;

-- 10 Llista els noms i els preus de tots els productes de la taula producto, truncant el valor del preu per a mostrar-lo sense cap xifra decimal.
SELECT
name AS name_product,
TRUNCATE(price, 0) AS truncate_price
FROM product;

-- 11 Llista el codi dels fabricants que tenen productes en la taula producto.
SELECT manufacturer_code
FROM product;

-- 12 Llista el codi dels fabricants que tenen productes en la taula producto, eliminant els codis que apareixen repetits.
SELECT DISTINCT manufacturer_code
FROM product;

-- 13. Llista els noms dels fabricants ordenats de manera ascendent.
SELECT name AS mmanufacturer_name
FROM manufacturer
ORDER BY name ASC;

-- 14. Llista els noms dels fabricants ordenats de manera descendent.
SELECT name AS manufacturer_name
FROM manufacturer
ORDER BY name DESC;


-- 15 Llista els noms dels productes ordenats, en primer lloc, pel nom de manera ascendent i, en segon lloc, pel preu de manera descendent.
SELECT name, price
FROM product
ORDER BY name ASC, price DESC;

-- 16 Retorna una llista amb les 5 primeres files de la taula fabricante.
SELECT *
FROM manufacturer
LIMIT 5;

-- 17 Retorna una llista amb 2 files a partir de la quarta fila de la taula fabricante. La quarta fila també s'ha d'incloure en la resposta.
SELECT *
FROM manufacturer
LIMIT 2 OFFSET 3;

-- 18 Llista el nom i el preu del producte més barat. (Utilitza solament les clàusules ORDER BY i LIMIT). NOTA: Aquí no podria usar MIN(preu), necessitaria GROUP BY.
SELECT name, price
FROM product
ORDER BY price ASC
LIMIT 1;

-- 19 Llista el nom i el preu del producte més car. (Utilitza solament les clàusules ORDER BY i LIMIT). NOTA: Aquí no podria usar MAX(preu), necessitaria GROUP BY.
SELECT name, price
FROM product
ORDER BY price DESC
LIMIT 1;

-- 20 Llista el nom de tots els productes del fabricant el codi de fabricant del qual és igual a 2.
SELECT name
FROM product
WHERE manufacturer_code = 2;

-- 21 Retorna una llista amb el nom del producte, preu i nom de fabricant de tots els productes de la base de dades.
SELECT p.name AS product_name, price, m.name As manufacturer_name
FROM product p
JOIN manufacturer m ON p.manufacturer_code = m.code;

-- 22 Retorna una llista amb el nom del producte, preu i nom de fabricant de tots els productes de la base de dades. Ordena el resultat pel nom del fabricant, per ordre alfabètic.
SELECT p.name AS product_name, p.price, m.name AS manufacturer_name
FROM product p
JOIN manufacturer m ON p.manufacturer_code = m.code
ORDER BY m.name ASC;

-- 23 Retorna una llista amb el codi del producte, nom del producte, codi del fabricador i nom del fabricador, de tots els productes de la base de dades.
SELECT p.code AS product_code, p.name AS product_name, m.code AS manufacturer_code, m.name AS manufacturer_name
FROM product p
JOIN manufacturer m ON p.manufacturer_code = m.code;

-- 24 Retorna el nom del producte, el seu preu i el nom del seu fabricant, del producte més barat.
SELECT p.name As product_name, p.price As product_price, m.name As manufacturer_name
FROM product p
JOIN manufacturer m ON p.manufacturer_code = m.code
ORDER BY price ASC
LIMIT 1;

-- 25 Retorna el nom del producte, el seu preu i el nom del seu fabricant, del producte més car.
SELECT p.name As product_name, p.price As product_price, m.name As manufacturer_name
FROM product p
JOIN manufacturer m ON p.manufacturer_code = m.code
ORDER BY price DESC
LIMIT 1;

-- 26 Retorna una llista de tots els productes del fabricant Lenovo.
SELECT p.name As product_name
FROM product p
JOIN manufacturer m ON p.manufacturer_code = m.code
WHERE m.name = 'Lenovo';

-- 27 Retorna una llista de tots els productes del fabricant Crucial que tinguin un preu major que 200 €.
SELECT *
FROM product p
JOIN manufacturer m ON p.manufacturer_code = m.code
WHERE m.name = 'Crucial'
AND price > 200;

-- 28 Retorna un llistat amb tots els productes dels fabricants Asus, Hewlett-Packard i Seagate. Sense utilitzar l'operador IN.
SELECT *
FROM producto P
JOIN manufacturer m ON P.code = m.code
WHERE manufacturar.name = "Asus" OR "Hewlett-Packard" OR "Seagate" ;

-- 29 Retorna un llistat amb tots els productes dels fabricants Asus, Hewlett-Packard i Seagate. Fent servir l'operador IN.
SELECT *
FROM product p
JOIN manufacturer m ON p.manufacturer_code = m.code
WHERE m.name IN ("Asus","Hewlett-Packard","Seagate");

-- 30 Retorna un llistat amb el nom i el preu de tots els productes dels fabricants el nom dels quals acabi per la vocal e.
SELECT p.name, p.price
FROM product p
JOIN manufacturer m ON p.manufacturer_code = m.code
WHERE m.name LIKE '%e';

-- 31 Retorna un llistat amb el nom i el preu de tots els productes el nom de fabricant dels quals contingui el caràcter w en el seu nom.
SELECT p.name, p.price
FROM product p
JOIN manufacturer m ON p.manufacturer_code = m.code
WHERE m.name LIKE '%w%';

-- 32 Retorna un llistat amb el nom de producte, preu i nom de fabricant, de tots els productes que tinguin un preu major o igual a 180 €. Ordena el resultat, en primer lloc, pel preu (en ordre descendent) i, en segon lloc, pel nom (en ordre ascendent).
SELECT p.name, p.price, m.name AS manufacturer_name
FROM product p
JOIN manufacturer m ON p.manufacturer_code = m.code
WHERE p.price >= 180
ORDER BY p.price DESC, p.name ASC;

-- 33 Retorna un llistat amb el codi i el nom de fabricant, solament d'aquells fabricants que tenen productes associats en la base de dades.
SELECT DISTINCT m.code AS manufacturer_code,
m.name As manudacturer_name,
p.name AS product_name
FROM manufacturer m
LEFT JOIN product p ON m.code = p.manufacturer_code;

-- 34 Retorna un llistat de tots els fabricants que existeixen en la base de dades, juntament amb els productes que té cadascun d'ells. El llistat haurà de mostrar també aquells fabricants que no tenen productes associats.
SELECT m.code AS manufacturer_code,
m.name AS manufacturer_name
FROM manufacturer m
LEFT JOIN product p ON m.code = p.manufacturer_code
WHERE p.name IS NULL;

-- 35 Retorna un llistat on només apareguin aquells fabricants que no tenen cap producte associat.
SELECT *
FROM product
WHERE manufacturer_code IN (
SELECT code
FROM manufacturer
WHERE name = 'Lenovo'
);

-- 36 Retorna tots els productes del fabricador Lenovo. (Sense utilitzar INNER JOIN).
SELECT p.name As product_name,
p.price AS product_price
FROM product p
JOIN manufacturer m ON p.manufacturer_code = m.code
WHERE m.name = 'Lenovo'
ORDER BY price DESC
LIMIT 1;

-- 37 Retorna totes les dades dels productes que tenen el mateix preu que el producte més car del fabricant Lenovo. (Sense usar INNER JOIN).
SELECT p.name As product_name,
p.price AS product_price
FROM product p
JOIN manufacturer m ON p.manufacturer_code = m.code
WHERE m.name = 'Hewlett-Packard'
ORDER BY price ASC
LIMIT 1;

-- 38 Llista el nom del producte més car del fabricant Lenovo.
SELECT p.name As product_name,
p.price AS product_price
FROM product p
WHERE price >= (
SELECT p.price AS product_price
FROM product p
JOIN manufacturer m ON p.manufacturer_code = m.code
WHERE m.name = 'Lenovo'
ORDER BY price DESC
LIMIT 1
);

-- 39 Llista el nom del producte més barat del fabricant Hewlett-Packard.
SELECT p.name AS product_name,
p.price AS product_price
FROM product p
JOIN manufacturer m ON p.manufacturer_code = m.code
WHERE m.name = 'Asus'
AND p.price > (
SELECT AVG(p2.price)
FROM product p2
JOIN manufacturer m2 ON p2.manufacturer_code = m2.code
WHERE m2.name = 'Asus'
);

-- 40 Retorna tots els productes de la base de dades que tenen un preu major o igual al producte més car del fabricant Lenovo.
SELECT p.name AS product_name,
       p.price AS product_price
FROM product p
WHERE p.price >= (
    SELECT MAX(p2.price)
    FROM product p2
    JOIN manufacturer m2 ON p2.manufacturer_code = m2.code
    WHERE m2.name = 'Lenovo'
);

-- 41 Llista tots els productes del fabricant Asus que tenen un preu superior al preu mitjà de tots els seus productes.
SELECT p.name AS product_name,
       p.price AS product_price
FROM product p
JOIN manufacturer m ON p.manufacturer_code = m.code
WHERE m.name = 'Asus'
  AND p.price > (
      SELECT AVG(p2.price)
      FROM product p2
      JOIN manufacturer m2 ON p2.manufacturer_code = m2.code
      WHERE m2.name = 'Asus'
  );

