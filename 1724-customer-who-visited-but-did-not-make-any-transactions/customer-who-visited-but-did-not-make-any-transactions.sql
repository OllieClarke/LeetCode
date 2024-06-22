/* Write your T-SQL query statement below */
SELECT customer_id, count(A.visit_id) AS "count_no_trans"
FROM Visits A
LEFT JOIN Transactions B on A.visit_id = B.visit_id
WHERE B.visit_id IS NULL
GROUP BY customer_id