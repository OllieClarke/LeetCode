/* Write your T-SQL query statement below */
--make a rownumber
WITH ab AS
(SELECT *, 
ROW_NUMBER() OVER (PARTITION BY email ORDER BY id ASC) as row
FROM person
)
DELETE
FROM ab
WHERE row>1