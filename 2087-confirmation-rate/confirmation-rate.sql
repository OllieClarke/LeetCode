/* Write your T-SQL query statement below */
WITH ab AS (
    SELECT a.user_id,
    CAST(SUM(CASE WHEN b.action ='confirmed' THEN 1 ELSE 0 END) as float) as "conf",
    CAST(COUNT(b.time_stamp) as float) as "tot"
    FROM signups as a
    LEFT JOIN confirmations as b on a.user_id = b.user_id
    GROUP BY a.user_id
)
SELECT user_id, CASE WHEN tot>0 THEN ROUND(conf/tot,2) ELSE 0 END as "confirmation_rate"
from ab