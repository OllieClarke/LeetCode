/* Write your T-SQL query statement below */
WITH tot as(
    SELECT COUNT(DISTINCT product_key) as total
    FROM product
)
SELECT customer_id
FROM customer
CROSS JOIN tot
GROUP BY customer_id, total
HAVING count(DISTINCT product_key) = total 