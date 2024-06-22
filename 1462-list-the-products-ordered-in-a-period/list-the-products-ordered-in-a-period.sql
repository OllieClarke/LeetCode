/* Write your T-SQL query statement below */
--get products with over 100 units in feb
WITH agg as(
    SELECT product_id
    , left(order_date,7) as month
    , SUM(unit) as unit
    FROM Orders
    WHERE left(order_date,7) = '2020-02'
    GROUP BY product_id, left(order_date,7)
    HAVING sum(unit)>=100
)
SELECT product_name
, unit
FROM Products
JOIN agg on Products.product_id = agg.product_id