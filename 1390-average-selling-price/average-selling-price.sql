/* Write your T-SQL query statement below */
--aggregate unitsSold
WITH agg as(
    SELECT product_id, purchase_date, sum(units) as "units"
    from UnitsSold
    Group By product_id, purchase_date
),
--join on the correct price
 jn as(
    SELECT a.product_id, CAST(price as float) as price, ISNULL(CAST(units as float),0) as units
    FROM Prices as a
    LEFT Join agg ON a.product_id=agg.product_id
    WHERE (purchase_date>=start_date
    AND purchase_date<=end_date) OR purchase_date IS NULL
)
--find answer
SELECT product_id, ROUND(CASE WHEN SUM(units) = 0 THEN 0 ELSE SUM(price*units)/SUM(units) END,2) AS average_price
FROM jn
GROUP BY product_id