/* Write your T-SQL query statement below */
--get products with over 100 units in feb
WITH agg as(
    SELECT product_id
    , SUM(unit) as unit
    FROM Orders
    WHERE left(order_date,7) = '2020-02'
    GROUP BY product_id
    HAVING sum(unit)>=100
)
SELECT product_name
, unit
FROM Products
JOIN agg on Products.product_id = agg.product_id