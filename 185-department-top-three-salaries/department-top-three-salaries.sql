/* Write your T-SQL query statement below */
--Create a table with the rank
with rnk as(
SELECT 
b.name as "Department",
a.name as "Employee",
a.salary as "Salary",
DENSE_RANK() OVER (PARTITION BY a.departmentId ORDER BY a.salary DESC) as "Rank"
FROM Employee a
JOIN Department b on a.departmentId = b.id
)
--Get answer
SELECT
Department, Employee, Salary
FROM rnk
WHERE Rank<4