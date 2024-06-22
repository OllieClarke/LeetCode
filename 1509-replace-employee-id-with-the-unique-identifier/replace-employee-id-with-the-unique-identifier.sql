/* Write your T-SQL query statement below */
SELECT name, unique_id
From employees
LEFT join EmployeeUNI on employees.id = EmployeeUNI.id