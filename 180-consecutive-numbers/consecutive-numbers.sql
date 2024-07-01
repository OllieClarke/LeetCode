/* Write your T-SQL query statement below */
--join to get pairings
WITH jn AS(
SELECT a.id
, a.num
, b.id as "id2"
, CAST(a.id-b.id as varchar(14)) as "diff"
FROM logs a 
JOIN logs b ON a.num = b.num AND a.id >= b.id
)
--concatenate diffs between ids
, agg AS(
SELECT
id, num, string_agg(diff,',') WITHIN GROUP (ORDER BY id2 DESC) as concat
FROM jn
GROUP BY id, num
)
--keep at least 3 consecs
SELECT num as ConsecutiveNums
from agg
WHere concat LIKE '0,1,2' OR concat LIKE '0,1,2,%'
GROUP BY num
