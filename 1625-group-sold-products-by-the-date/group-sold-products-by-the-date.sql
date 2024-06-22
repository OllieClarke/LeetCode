/* Write your T-SQL query statement below */
--get unique list ordered alphabetically
WITH prop as(
    SELECT product
    , sell_date
    FROM activities
    GROUP BY product, sell_date
)
SELECT sell_date
, COUNT(product) AS num_sold
, STRING_AGG(product,',') as products
FROM prop
GROUP BY sell_date