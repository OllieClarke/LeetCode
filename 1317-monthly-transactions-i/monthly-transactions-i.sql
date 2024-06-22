/* Write your T-SQL query statement below */
SELECT LEFT(trans_date,7) as "month"
, country
, count(amount) as "trans_count"
, SUM(CASE when state='approved' then 1 else 0 end) as "approved_count"
, SUM(amount) as "trans_total_amount"
, SUM(CASE when state='approved' THEN amount else 0 end) as "approved_total_amount"
FROM Transactions
GROUP BY country, LEFT(trans_date,7);