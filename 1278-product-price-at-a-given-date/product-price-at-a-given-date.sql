/* Write your T-SQL query statement below */
--put a row number on all records on or before date
WITH rw AS(
SELECT product_id
, new_price as price
, row_number() OVER (partition by product_id ORDER BY change_date DESC) as row
FROM products
WHERE change_date <= '2019-08-16'
)
--get all product ids with 10 as price
, tn AS(
    SELECT product_id
    , 10 as price
    FROM products
    GROUP BY product_id
)
--get the final table
SELECT b.product_id
, COALESCE(a.price, b.price) as price
from tn b
LEFT JOIN rw a
ON b.product_id = a.product_id
WHERE a.row = 1 OR a.row IS NULL