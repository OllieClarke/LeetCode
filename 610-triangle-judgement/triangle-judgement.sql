/* Write your T-SQL query statement below */
SELECT *,
CASE WHEN x+y>z AND x+z>y and y+z>x THEN 'Yes' ELSE 'No' END as triangle
from Triangle 