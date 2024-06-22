/* Write your T-SQL query statement below */
--find 1st date per player
WITH fst as(
    SELECT player_id
    , Min(event_date) as first
    from Activity
    GROUP BY player_id
)
--count the players who came back on day 2
, jn as(
    SELECT CAST(COUNT(a.player_id) as decimal (10,2)) as back
    FROM
    Activity as a
    JOIN fst on a.player_id = fst.player_id
    WHERE DATEDIFF(day,first,event_date)=1
)
--get total players
, play as(
    SELECT CAST(COUNT(DISTINCT player_id) as decimal (10,2)) as total
    FROM Activity
)
--get fraction
SELECT ROUND(back/total,2) as fraction
FROM jn 
CROSS JOIN play