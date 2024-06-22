/* Write your T-SQL query statement below */
--god I wish I could RegEx
SELECT *
FROM users
WHERE mail LIKE '[a-z]%@leetcode.com'
AND mail NOT LIKE '%[^a-z0-9._-]%@leetcode.com'