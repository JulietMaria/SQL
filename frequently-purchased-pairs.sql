--https://datalemur.com/questions/frequently-purchased-pairs

SELECT COUNT(DISTINCT CONCAT(t1.product_id, t2.product_id)) AS unique_pairs
FROM transactions t1 
JOIN transactions t2 
  ON t1.transaction_id = t2.transaction_id
  AND t1.product_id > t2.product_id;
/*
SELECT DISTINCT CONCAT(t1.product_id, t2.product_id) AS unique_pairs
FROM transactions t1 
JOIN transactions t2 
  ON t1.transaction_id = t2.transaction_id
  AND t1.product_id > t2.product_id;*/

--https://youtu.be/zw45mHnlSgo -->explanation
