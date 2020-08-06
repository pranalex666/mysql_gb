-- Task 1

SELECT user_id, (SELECT name FROM users WHERE id = user_id) 
AS 
name
FROM 
orders;

-- Task 2

SELECT id, name, price, (SELECT name FROM catalogs WHERE id = catalog_id) 
AS 
types 
FROM products;

-- Task 3

CREATE TABLE flights (
id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
city_from VARCHAR(255),
to_city VARCHAR(255)
);

INSERT INTO 
	flights (city_from, to_city)
VALUES
	('moscow','omsk'),
	('novgorod','kazan'),
	('irkutsk','moscow'),
	('omsk','irkutsk'),
	('moscow','kazan');

CREATE TABLE cities(
	label VARCHAR(255),
	name VARCHAR(255)
);

INSERT INTO
	cities (label, name)
VALUES
	('moscow','москва'),
	('irkutsk','иркутск'),
	('novgorod','новгород'),
	('kazan','казань'),
	('omsk','омск');

SELECT city_from, name FROM flights, cities WHERE city_from = label;



