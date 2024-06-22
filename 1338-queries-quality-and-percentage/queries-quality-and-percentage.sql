/* Write your T-SQL query statement below */
SELECT query_name
, ROUND(SUM(CAST(rating as decimal (10,2))/cast(position as decimal (10,2)))/CAST(COUNT(result) as decimal (10,2)),2) as quality
, ROUND(SUM(CAST(case when rating<3 then 1 else 0 end as decimal (10,2)))/CAST(COUNT(result) as decimal (10,2))*100,2) as poor_query_percentage
from queries
WHERE query_name IS NOT NULL
Group by query_name