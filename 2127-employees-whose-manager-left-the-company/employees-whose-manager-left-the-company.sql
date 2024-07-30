/* Write your T-SQL query statement below */
 select a.employee_id
    from Employees a
    LEFT JOIN Employees b
    on a.manager_id = b.employee_id
    where b.employee_id IS NULL
    AND a.manager_id IS NOT NULL
    AND a.salary <30000
    GROUP BY a.employee_id
    ORDER BY a.employee_id
