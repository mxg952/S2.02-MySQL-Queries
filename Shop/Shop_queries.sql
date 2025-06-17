SELECT name AS product_name
FROM product;

SELECT name AS product_name, price AS product_price
FROM product;

SELECT code, name , price, manufacturer_code
FROM product;

SELECT Name,
price AS Euros,
price * 1.10 AS Dolars
FROM product;

SELECT 
    UPPER(name) AS Upper_name,
    price AS preu
FROM product;

SELECT 
    LOWER(name) AS Upper_name,
    price AS preu
FROM product;

SELECT
    name AS manufacturer_name,
    UPPER (SUBSTRING(name FROM 1 FOR 2)) AS Initials_name
FROM product;

SELECT 
	name,
	ROUND(price) AS round_price
FROM product;

SELECT 
    name AS name_product,
    TRUNCATE(price, 0) AS truncate_price
FROM product;

SELECT manufacturer_code
FROM product;

SELECT DISTINCT manufacturer_code 
FROM product;

SELECT name, price
FROM product
ORDER BY name ASC, price DESC;

SELECT *
FROM manufacturer
LIMIT 5;

SELECT *
FROM manufacturer
LIMIT 2 OFFSET 3;

SELECT name, price
FROM product
ORDER BY price ASC
LIMIT 1;

SELECT name, price
FROM product
ORDER BY price DESC
LIMIT 1;

SELECT name
FROM product
WHERE manufacturer_code = 2;

SELECT p.name AS product_name, price, m.name As manufacturer_name
FROM product p
JOIN manufacturer m ON p.manufacturer_code = m.code;

SELECT p.name AS product_name, p.price, m.name AS manufacturer_name
FROM product p
JOIN manufacturer m ON p.manufacturer_code = m.code
ORDER BY m.name ASC;

SELECT p.code AS product_code, p.name AS product_name, m.code AS manufacturer_code, m.name AS manufacturer_name
FROM product p
JOIN manufacturer m ON p.manufacturer_code = m.code

SELECT p.name As product_name, p.price As product_price, m.name As manufacturer_name
FROM product p 
JOIN manufacturer m ON p.manufacturer_code = m.code
ORDER BY price ASC 
LIMIT 1;

SELECT p.name As product_name
FROM product p 
JOIN manufacturer m ON p.manufacturer_code = m.code
WHERE m.name = 'Lenovo';

SELECT *
FROM product p
JOIN manufacturer m ON p.manufacturer_code = m.code
WHERE m.name = 'Crucial'
AND price > 200;

SELECT * 
FROM producto P
JOIN manufacturer m ON P.code = m.code
WHERE manufacturar.name = "Asus" OR "Hewlett-Packard" OR "Seagate" ; 

SELECT *
FROM product p
JOIN manufacturer m ON p.manufacturer_code = m.code
WHERE m.name IN ("Asus","Hewlett-Packard","Seagate");

SELECT p.name, p.price
FROM product p
JOIN manufacturer m ON p.manufacturer_code = m.code
WHERE m.name LIKE '%e';

SELECT p.name, p.price
FROM product p
JOIN manufacturer m ON p.manufacturer_code = m.code
WHERE m.name LIKE '%w%';

SELECT p.name, p.price, m.name AS manufacturer_name
FROM product p
JOIN manufacturer m ON p.manufacturer_code = m.code
WHERE p.price >= 180
ORDER BY p.price DESC, p.name ASC;

SELECT DISTINCT m.code AS manufacturer_code, 
				m.name As manudacturer_name, 
				p.name AS product_name
FROM manufacturer m
LEFT JOIN product p ON m.code = p.manufacturer_code;

SELECT m.code AS manufacturer_code,
       m.name AS manufacturer_name
FROM manufacturer m
LEFT JOIN product p ON m.code = p.manufacturer_code
WHERE p.name IS NULL;

SELECT *
FROM product
WHERE manufacturer_code IN (
    SELECT code
    FROM manufacturer
    WHERE name = 'Lenovo'
);

SELECT p.name As product_name, 
		p.price AS product_price
FROM product p
JOIN manufacturer m ON p.manufacturer_code = m.code
WHERE m.name = 'Lenovo'
ORDER BY price DESC
LIMIT 1;

SELECT p.name As product_name, 
		p.price AS product_price
FROM product p
JOIN manufacturer m ON p.manufacturer_code = m.code
WHERE m.name = 'Hewlett-Packard'
ORDER BY price ASC
LIMIT 1;



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