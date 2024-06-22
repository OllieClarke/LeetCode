/* Write your T-SQL query statement below */
SELECT author_id as "id"
from Views
WHERE author_id = viewer_id
GROUP By author_id