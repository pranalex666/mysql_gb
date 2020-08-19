-- Lesson 9
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

-- Task 3

