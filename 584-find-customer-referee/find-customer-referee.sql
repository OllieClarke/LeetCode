/* Write your T-SQL query statement below */
SELECT name
from Customer
WHERE ISNULL(referee_id,0)!=2