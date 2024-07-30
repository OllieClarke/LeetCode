/* Write your T-SQL query statement below */
/*Find the managers who left*/
With lft as(
    select a.manager_id
    from Employees a
    LEFT JOIN Employees b
    on a.manager_id = b.employee_id
    WHERE b.employee_id IS NULL AND a.manager_id IS NOT NULL
)
/*Get the employees with a left manager and salary below 30k*/
SELECT a.employee_id
FROM Employees a
JOIN lft on a.manager_id = lft.manager_id
WHERE salary <30000
GROUP BY a.employee_id