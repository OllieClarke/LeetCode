/* Write your T-SQL query statement below */
SELECT teacher_id
, COUNT(DISTINCT subject_id) as cnt
from teacher
GROUP BY teacher_id