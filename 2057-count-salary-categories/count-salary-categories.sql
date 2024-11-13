/* Write your T-SQL query statement below */
WITH gp AS(
    SELECT
    account_id
    , income
    , CASE WHEN income < 20000 THEN 'Low Salary'
    WHEN income >50000 THEN 'High Salary'
    ELSE 'Average Salary' END AS category
    FROM Accounts
    --hard code values
    UNION ALL
    SELECT null,
    NULL, 'Low Salary'
    UNION ALL
    SELECT NULL,
    NULL, 'Average Salary'
    UNION ALL
    SELECT NULL,
    NULL, 'High Salary'
)
SELECT category, COUNT(account_id) as accounts_count 
FROM gp
GROUP BY category
--Order low to high
ORDER BY CASE WHEN LEFT(category,1)='L' THEN 1 WHEN LEFT(category,1)='A' THEN 2 ELSE 3 END
