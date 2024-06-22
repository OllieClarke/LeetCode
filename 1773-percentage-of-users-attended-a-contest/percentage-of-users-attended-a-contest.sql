/* Write your T-SQL query statement below */
WITH tot as(SELECT CAST(COUNT(user_id)as DECIMAL (10,2)) as Total
FROM Users)
SELECT contest_id, ROUND((cast(COUNT(user_id) as DECIMAL (10,2))/total)*100,2) as percentage
FROM Register
CROSS JOIN tot 
GROUP BY contest_id, total
ORDER BY percentage DESC, contest_id ASC