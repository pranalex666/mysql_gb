-- Lesson 8

-- Task 1

SELECT gender, COUNT(*) AS TOTAL_LIKES FROM users JOIN profiles
ON users.id = profiles.user_id GROUP BY gender ORDER BY TOTAL_LIKES DESC LIMIT 1;

-- Task 2

SELECT * FROM profiles;
SELECT * FROM likes;
SELECT * FROM target_types;

SELECT CONCAT(first_name,' ', last_name) AS Name, COUNT(*) AS TOATAL_LIKES FROM users JOIN profiles
ON users.id = profiles.user_id  JOIN likes 
ON profiles.user_id = likes.target_id WHERE target_type_id = 2 GROUP BY Name ORDER BY TOATAL_LIKES DESC LIMIT 10;

-- Task 3
SELECT CONCAT(first_name,' ', last_name) AS Name, COUNT(*) AS TOATAL_LIKES FROM users JOIN profiles
ON users.id = profiles.user_id  JOIN likes 
ON profiles.user_id = likes.user_id GROUP BY Name ORDER BY TOATAL_LIKES LIMIT 10;
