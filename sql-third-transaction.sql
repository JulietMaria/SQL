--https://datalemur.com/questions/sql-third-transaction

--using subquery & ROW_NUMBER()
SELECT 
  user_id, 
  spend, 
  transaction_date
FROM (
  SELECT 
  user_id, 
  spend, 
  transaction_date, 
  ROW_NUMBER() OVER (
    PARTITION BY user_id ORDER BY transaction_date) AS row_num
FROM transactions
) AS trans_num 
WHERE row_num = 3;

--using with clause & RANK()
WITH cte AS (
SELECT user_id,
spend,
transaction_date,
RANK () OVER (PARTITION BY user_id ORDER BY transaction_date)
AS rnk
FROM transactions
)

SELECT user_id, spend, transaction_date
FROM cte 
WHERE rnk = 3
