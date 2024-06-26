/* Write your T-SQL query statement below */
-- join to find managers and their underlings
WITH s AS(
    SELECT
    a.employee_id
    , a.name
    , CAST(b.age AS DECIMAL (10,2)) as age
    , b.employee_id as reports
    FROM Employees a
    JOIN Employees b on a.employee_id = b.reports_to
)
--aggregate to manager level
SELECT employee_id
, name
, COUNT(reports) as reports_count
, ROUND(AVG(age),0) as average_age 
FROM s
GROUP BY employee_id, name
ORDER BY employee_id