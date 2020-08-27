-- LESSON 9

-- Транзакции, переменные, представления

-- Task 1

SELECT * FROM users;
ALTER TABLE users ADD (
name VARCHAR(255)
);
ALTER TABLE users ADD (
birthday_at DATE,
created_at DATETIME,
updated_at DATETIME
);
DESC users;
START TRANSACTION;
INSERT sample.users SELECT * FROM shop.users WHERE id = 1;
DELETE FROM shop.users WHERE id = 1;
COMMIT;

-- Task 2

USE shop;
CREATE VIEW prod_n AS SELECT products.id, products.name AS description, catalogs.name 
FROM 
	products 
JOIN 
	catalogs 
ON products.id = catalogs.id;
SELECT * FROM prod_n;


-- Администрирование MySQL

-- Task 1

CREATE USER shop;
CREATE USER shop_read;
GRANT SELECT ON shop.* TO shop_read;
GRANT ALL ON shop.* TO shop_read;

-- Хранимые процедуры и функции, триггеры

-- Task 1

DROP FUNCTION IF EXISTS hello;
DELIMITER //
CREATE FUNCTION hello ()
RETURNS VARCHAR(255) NOT DETERMINISTIC
BEGIN
	DECLARE hour INT;
	SET hour = HOUR(NOW());
	CASE
		WHEN hour BETWEEN 0 AND 5 THEN
		RETURN "Goodnight";
		WHEN hour BETWEEN 6 AND 11 THEN
		RETURN "Goodmorning";
		WHEN hour BETWEEN 12 AND 17 THEN
		RETURN "Good day";
		WHEN hour BETWEEN 18 AND 23 THEN
		RETURN "Good evening";
	END CASE;
END//
DELIMITER ;
SELECT hello () AS Greeting;

-- Task 2

DROP TRIGGER IF EXISTS insert_null_value;
delimiter //
CREATE TRIGGER insert_null_value BEFORE INSERT ON products
FOR EACH ROW
BEGIN
	IF NEW.name IS NULL AND NEW.description IS NULL THEN
    SIGNAL SQLSTATE '23000' 
	SET MESSAGE_TEXT = 'Name or description are NULL';
	END IF;
END //
delimiter ;


