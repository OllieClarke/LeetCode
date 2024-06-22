/* Write your T-SQL query statement below */
SELECT class
FROM COURSES
GROUP BY class
HAVING COUNT(student)>=5