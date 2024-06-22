/* Write your T-SQL query statement below */
--get first year per product
WITH mn as(
    SELECT product_id,
    MIN(year) as first_year
    FROM sales
    GROUP BY product_id
)
SELECT a.product_id,
first_year, quantity, price
from sales as a
JOIN mn on a.product_id = mn.product_id
WHERE year=first_year