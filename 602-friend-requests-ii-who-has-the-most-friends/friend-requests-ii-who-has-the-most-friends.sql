/* Write your T-SQL query statement below */
--I should learn how to unpivot
WITH unpvt as(
SELECT requester_id as id
FROM RequestAccepted
UNION ALL
SELECT accepter_id as id
FROM requestAccepted
)
--Get popular person
SELECT TOP 1
id, COUNT(1) as num
FROM unpvt
GROUP BY id
ORDER BY COUNT(1) DESC