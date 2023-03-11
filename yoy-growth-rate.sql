--https://datalemur.com/questions/yoy-growth-rate

WITH yearly_spend AS (
  SELECT 
    EXTRACT(YEAR FROM transaction_date) AS year, 
    product_id,
    spend AS curr_year_spend
  FROM user_transactions
), 
yearly_variance AS (
  SELECT 
    *, 
    LAG(curr_year_spend, 1) OVER (
      PARTITION BY product_id
      ORDER BY product_id, year) AS prev_year_spend 
  FROM yearly_spend) 

SELECT 
  year,
  product_id, 
  curr_year_spend, 
  prev_year_spend, 
  ROUND(100 * (curr_year_spend - prev_year_spend)/ prev_year_spend,2) AS yoy_rate 
FROM yearly_variance;
