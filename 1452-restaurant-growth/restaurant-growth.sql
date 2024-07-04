/* Write your T-SQL query statement below */
--get total daily values
WITH ds AS(
    SELECT visited_on
    , SUM(amount) as amount
    FROM Customer
    GROUP BY visited_on
)
--get answer
select a.visited_on
, SUM(b.amount) as amount
, ROUND(SUM(CAST(b.amount as float))/7,2) as average_amount
FROM ds a
JOIN ds b on a.visited_on >=b.visited_on
AND dateadd(day,-6,a.visited_on) <=b.visited_on
GROUP BY a.visited_on
HAVING count(DISTINCT b.visited_on)=7
ORDER BY a.visited_on 