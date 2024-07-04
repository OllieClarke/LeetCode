/* Write your T-SQL query statement below */
--find top user
WITH tm as(
    SELECT TOP 1 a.user_id
    , COUNT(movie_id) as count
    , name
    FROM MovieRating a
    JOIN Users b on a.user_id = b.user_id
    GROUP BY a.user_id, name
    ORDER BY COUNT(movie_id) DESC, MIN(name) ASC
)
--find best film in feb
, ar as(
    SELECT TOP 1 a.movie_id
    , title
    , AVG(CAST(rating as float)) as avgrat
    FROM MovieRating a
    JOIN Movies b on a.movie_id = b.movie_id
    WHERE LEFT(created_at,7)='2020-02'
    GROUP BY a.movie_id, title
    ORDER BY AVG(CAST(rating as float)) DESC, MIN(title) ASC
)
--create final output
SELECT name as results
FROM tm
UNION ALL
SELECT title
from ar