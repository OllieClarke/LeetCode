/* Write your T-SQL query statement below */
WITH a AS(
--employees with multiple deps
SELECT employee_id, department_id
FROM employee
WHERE primary_flag = 'Y'
UNION ALL
--employees with 1 dep
SELECT employee_id,
MIN(department_id) as department_id
From employee
GROUP BY employee_id
HAVING count(employee_id)=1)
--dedupe table
SELECT * FROM a
GROUP BY employee_id, department_id
ORDER BY employee_id