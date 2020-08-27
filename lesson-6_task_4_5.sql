-- Lesson 6

-- Task 4

-- 10 самых молодых пользоватлей и кол-во лайков

SELECT (SELECT CONCAT(first_name,' ',last_name ) FROM users WHERE users.id=profiles.user_id) AS name, birthday,
(SELECT COUNT(*) FROM likes WHERE likes.target_id = profiles.user_id) AS total 
FROM profiles ORDER BY birthday DESC LIMIT 10;

-- всего лайков 10 самым молодым пользователям
SELECT SUM(total) FROM ( SELECT (SELECT CONCAT(first_name,' ',last_name ) FROM users WHERE users.id=profiles.user_id) AS name, birthday,
(SELECT COUNT(*) FROM likes WHERE likes.target_id = profiles.user_id) AS total 
FROM profiles ORDER BY birthday DESC LIMIT 10) AS total_user;

-- Task 5

SELECT * FROM likes;

SELECT 
CONCAT(first_name, ' ', last_name) AS name, 
(SELECT COUNT(*) FROM likes WHERE likes.user_id = users.id) + 
(SELECT COUNT(*) FROM media WHERE media.user_id = users.id) + 
(SELECT COUNT(*) FROM messages WHERE messages.from_user_id = users.id) AS total 
FROM users
ORDER BY total 
LIMIT 10;

