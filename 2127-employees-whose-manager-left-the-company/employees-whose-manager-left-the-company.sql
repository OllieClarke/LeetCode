/* Write your T-SQL query statement below */
select a.employee_id
from employees a
LEFT JOIN employees b
ON a.manager_id = b.employee_id
WHERE a.salary <30000
AND b.salary IS NULL
AND a.manager_id IS NOT NULL
ORDER BY a.employee_id ASC