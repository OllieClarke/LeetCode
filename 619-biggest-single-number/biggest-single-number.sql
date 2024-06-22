/* Write your T-SQL query statement below */
WITH sng as(
    SELECT num, count(num) as cnt
    FROM MyNumbers
    GROUP BY num
    HAVING count(num)=1
)
SELECT 
MAX(num) as num
FROM sng