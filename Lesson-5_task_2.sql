
-- Lesson 5 

-- «Агрегация данных» 

-- Task 

SELECT 
DATE_FORMAT(DATE(CONCAT(YEAR (NOW()),'.',MONTH (birthday),'.',DAY(birthday))), '%W' ) AS days, COUNT(*) AS total 
FROM profiles GROUP BY days;