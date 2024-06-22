/* Write your T-SQL query statement below */
--distinct salaries
WITH dst AS(
    SELECT salary
    from Employee
    GROUP BY salary
)
--attach row number
, rn AS(
    SELECT salary,
    ROW_NUMBER() OVER (ORDER BY salary DESC) as row
    FROM dst
)
--union on nulls below 2nd salar
, nl as(
    SELECT salary as SecondHighestSalary
FROM rn
WHERE row = 2
UNION
SELECT null as SecondHighestSalary
FROM Employee
)
--just keep top row
SELECT TOP 1 SecondHighestSalary 
FROM nl
ORDER BY SecondHighestSalary DESC