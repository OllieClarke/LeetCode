/* Write your T-SQL query statement below */
SELECT user_id
, count(follower_id) as followers_count
from followers
GROUP BY user_id
ORDER BY user_id