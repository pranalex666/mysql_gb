-- LESSON 11

-- Оптимизация запросов

-- Task 1

DROP TABLE IF EXISTS logs;
CREATE TABLE logs (
	created_at DATETIME NOT NULL,
	table_name VARCHAR(45) NOT NULL,
	str_id BIGINT(20) NOT NULL,
	name_value VARCHAR(45) NOT NULL
) ENGINE = ARCHIVE;

DROP TRIGGER IF EXISTS watchlog_users;

delimiter //

CREATE TRIGGER watchlog_users AFTER INSERT ON users
FOR EACH ROW
BEGIN
	INSERT INTO logs (created_at, table_name, str_id, name_value)
	VALUES (NOW(), 'users', NEW.id, NEW.name);
END //

delimiter ;

DROP TRIGGER IF EXISTS watchlog_catalogs;

delimiter //

CREATE TRIGGER watchlog_catalogs AFTER INSERT ON catalogs
FOR EACH ROW
BEGIN
	INSERT INTO logs (created_at, table_name, str_id, name_value)
	VALUES (NOW(), 'catalogs', NEW.id, NEW.name);
END //

delimiter ;

DROP TRIGGER IF EXISTS watchlog_products;

delimiter //

CREATE TRIGGER watchlog_products AFTER INSERT ON products
FOR EACH ROW
BEGIN
	INSERT INTO logs (created_at, table_name, str_id, name_value)
	VALUES (NOW(), 'products', NEW.id, NEW.name);
END //

delimiter ;

SELECT * FROM users;
SELECT * FROM logs;

-- Task 2

DROP TABLE IF EXISTS users_n; 
CREATE TABLE users_n (
	id SERIAL PRIMARY KEY,
	name VARCHAR(255),
	birthday_at DATE,
	`created_at` DATETIME DEFAULT CURRENT_TIMESTAMP,
 	`updated_at` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);
DROP PROCEDURE IF EXISTS insert_users;

delimiter //

CREATE PROCEDURE insert_users ()
BEGIN
	DECLARE i INT DEFAULT 100;
	DECLARE j INT DEFAULT 0;
	WHILE i > 0 DO
		INSERT INTO users_n(name, birthday_at) VALUES (CONCAT('user', j), NOW());
		SET j = j + 1;
		SET i = i - 1;
	END WHILE;
SELECT * FROM users_n LIMIT 5;
END //
delimiter ;

CALL insert_users();