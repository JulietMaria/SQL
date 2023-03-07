--https://datalemur.com/questions/histogram-users-purchases

-- Convert query into a CTE using WITH statement
WITH latest_transaction AS (
  SELECT 
    transaction_date, 
    user_id, 
    product_id, 
    RANK() OVER (PARTITION BY user_id 
      ORDER BY transaction_date DESC) AS days_rank 
  FROM user_transactions) 
  
SELECT 
  transaction_date, 
  user_id,
  COUNT(product_id) AS purchase_count
FROM latest_transaction
WHERE days_rank = 1 
GROUP BY transaction_date, user_id
ORDER BY transaction_date;

--Using Subquery
SELECT 
  transaction_date, 
  user_id,
  COUNT(product_id) AS purchase_count
FROM (
  SELECT 
    transaction_date, 
    user_id, 
    product_id, 
    RANK() OVER (
      PARTITION BY user_id 
      ORDER BY transaction_date DESC) AS days_rank 
  FROM user_transactions) AS latest_transaction
WHERE days_rank = 1 
GROUP BY transaction_date, user_id
ORDER BY transaction_date;
