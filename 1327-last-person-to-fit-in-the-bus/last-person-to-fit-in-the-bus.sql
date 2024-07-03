/* Write your T-SQL query statement below */
--running sum
WITH rs AS(
    SELECT a.person_id
    , a.person_name
    , a.weight
    , a.turn
    , SUM(b.weight) as total_weight
    FROM queue a
    JOIN queue b on a.turn >= b.turn
    GROUP BY 
    a.person_id
    , a.person_name
    , a.weight
    , a.turn
)
SELECT TOP 1 person_name
FROM rs
WHERE total_weight <=1000
ORDER BY turn DESC