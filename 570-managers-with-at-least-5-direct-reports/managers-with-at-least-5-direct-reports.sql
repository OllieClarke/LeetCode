/* Write your T-SQL query statement below */
SELECT a.name
FROM employee as a
JOIN employee as b
ON a.id = b.managerId
GROUP BY a.name, a.id
HAVING COUNT(b.id)>=5