

DROP DATABASE IF EXISTS shop;
CREATE DATABASE shop CHARACTER SET utf8mb4;
USE shop;

CREATE TABLE manufacturer (
  code INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100) NOT NULL
);

CREATE TABLE product (
  code INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  price DOUBLE NOT NULL,
  manufacturer_code INT UNSIGNED NOT NULL,
  FOREIGN KEY (manufacturer_code) REFERENCES manufacturer(code)
);

INSERT INTO manufacturer VALUES(1, 'Asus');
INSERT INTO manufacturer VALUES(2, 'Lenovo');
INSERT INTO manufacturer VALUES(3, 'Hewlett-Packard');
INSERT INTO manufacturer VALUES(4, 'Samsung');
INSERT INTO manufacturer VALUES(5, 'Seagate');
INSERT INTO manufacturer VALUES(6, 'Crucial');
INSERT INTO manufacturer VALUES(7, 'Gigabyte');
INSERT INTO manufacturer VALUES(8, 'Huawei');
INSERT INTO manufacturer VALUES(9, 'Xiaomi');

INSERT INTO product VALUES(1, 'SATA3 1TB Hard Drive', 86.99, 5);
INSERT INTO product VALUES(2, '8GB DDR4 RAM', 120, 6);
INSERT INTO product VALUES(3, '1TB SSD Drive', 150.99, 4);
INSERT INTO product VALUES(4, 'GeForce GTX 1050Ti', 185, 7);
INSERT INTO product VALUES(5, 'GeForce GTX 1080 Xtreme', 755, 6);
INSERT INTO product VALUES(6, '24" LED Full HD Monitor', 202, 1);
INSERT INTO product VALUES(7, '27" LED Full HD Monitor', 245.99, 1);
INSERT INTO product VALUES(8, 'Yoga 520 Laptop', 559, 2);
INSERT INTO product VALUES(9, 'Ideapad 320 Laptop', 444, 2);
INSERT INTO product VALUES(10, 'HP Deskjet 3720 Printer', 59.99, 3);
INSERT INTO product VALUES(11, 'HP Laserjet Pro M26nw Printer', 180, 3);
