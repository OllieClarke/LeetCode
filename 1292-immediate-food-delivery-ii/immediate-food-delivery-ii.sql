/* Write your T-SQL query statement below */
--attach a row number based on customer order date
WITH rw as(
    SELECT ROW_NUMBER() OVER(PARTITION BY customer_id ORDER BY order_date ASC) as "row"
    , *
    FROM delivery
)
--just keep the first order per customer    
    , mm as (
    SELECT *
    from rw
    WHERE row=1
)
--find percentage immediate    
Select ROUND((SUM(CASE when customer_pref_delivery_date = order_date then 1 else 0 END)*1.00)/SUM(1.00)*100,2) as immediate_percentage
from mm
