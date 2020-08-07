-- Task 1

SELECT 
	user_id, name 
FROM 
	orders, users WHERE users.id = user_id;

-- Task 2

SELECT 
	products.id, products.name, products.price, catalogs.name
FROM 
	products, catalogs
WHERE catalogs.id = products.catalog_id;


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

SELECT city_from, name 
FROM 
	flights, cities 
WHERE 
	city_from = label;



