/* Write your T-SQL query statement below */
--count how many locations
With numbers as(
    SELECT 
    (CAST(lat as varchar(24)) +','+ CAST(lon as varchar(24))) as loc
    , count(pid) as loc_count
    FROM insurance
    GROUP BY (CAST(lat as varchar(24)) +','+ CAST(lon as varchar(24)))
)
--count how many 2015 values
, vals as(
    SELECT
    tiv_2015,
    COUNT(pid) as "2015_count"
    FROM insurance
    GROUP BY tiv_2015
)
--join together
, nums as(
    SELECT a.*
    , "2015_count"
    , loc_count
    FROM 
    insurance a
    Join vals b
    ON a.tiv_2015 = b.tiv_2015
    JOIN numbers c
    ON (CAST(a.lat as varchar(24)) +','+ CAST(a.lon as varchar(24))) = loc
)
--get answer
SELECT 
ROUND(SUM(CAST(tiv_2016 as DECIMAL (10,2))),2) as tiv_2016 
from nums
WHERE "2015_count">1 AND loc_count=1