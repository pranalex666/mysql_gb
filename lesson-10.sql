
-- Lesson 10

-- Task 1

-- Не индексируем где уникальный тип и ключи и где минимальное кол-во вариантов / строк исходя из этих ограничений кандидата 2 - first and last name

-- Task 2

SELECT DISTINCT (SELECT name FROM communities WHERE id = community_id) AS groups_name,
COUNT(communities_users.user_id) OVER( ) / (SELECT COUNT(*) FROM communities) AS avg_users,
FIRST_VALUE(CONCAT_WS(" ", users.first_name, users.last_name)) OVER (PARTITION BY communities_users.community_id ORDER BY profiles.birthday DESC) AS youngest,
FIRST_VALUE(CONCAT_WS(" ", users.first_name, users.last_name)) OVER (PARTITION BY communities_users.community_id ORDER BY profiles.birthday) AS oldest, 
COUNT(communities_users.user_id) OVER(PARTITION BY community_id) AS total_users_in_group,
COUNT(communities_users.user_id) OVER () AS total_users,
COUNT(communities_users.user_id) OVER(PARTITION BY community_id) / COUNT(communities_users.user_id) OVER () *100 AS '%' 
FROM communities
LEFT JOIN communities_users 
ON communities_users.community_id = communities.id
LEFT JOIN users 
ON communities_users.user_id = users.id
LEFT JOIN profiles 
ON profiles.user_id = users.id;
	



