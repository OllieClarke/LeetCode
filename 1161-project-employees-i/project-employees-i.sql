/* Write your T-SQL query statement below*/ 
SELECT project_id,ROUND(AVG(CAST(experience_years as decimal(10,2))),2) as average_years
FROM project as a
JOIN employee as e on a.employee_id=e.employee_id
GROUP BY project_id
ORDER BY project_id