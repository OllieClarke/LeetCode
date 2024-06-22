/* Write your T-SQL query statement below */
With pv AS(
    SELECT machine_id, process_id, [start] as "start", [end] as "end"
    from (
        Select * from Activity
    ) ac
    PIVOT 
    (MAX(timestamp) 
    FOR activity_type IN([start], [end])
    ) pvt
)
SELECT machine_id, ROUND(SUM("end"-"start")/COUNT(process_id),3) AS "processing_time"
from pv
GROUP BY machine_id