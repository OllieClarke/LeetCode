/* Write your T-SQL query statement below */
--Find max id
WITH mx AS(
    SELECT MAX(id) as max
    FROM seat
)
--Get Odd ids and add 1 (if less than max)
SELECT
id+1 as id
, student
FROM
seat
CROSS JOIN
mx
WHERE id%2 = 1
AND id<max
UNION ALL
--Get even ids and minus 1
SELECT
id-1 as id
, student
FROM seat
WHERE id%2=0
UNION ALL
--Bring in max id only if odd
SELECT
id
, student
FROM
seat
CROSS JOIN
mx
WHERE max%2 = 1
AND id=max
ORDER BY id