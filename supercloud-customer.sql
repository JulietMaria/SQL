--https://datalemur.com/questions/supercloud-customer

WITH supercloud AS (
SELECT 
  customers.customer_id, 
  COUNT(DISTINCT products.product_category) as unique_count
FROM customer_contracts AS customers
LEFT JOIN products 
  ON customers.product_id = products.product_id
GROUP BY customers.customer_id
)

SELECT customer_id
FROM supercloud
WHERE unique_count = (
  SELECT COUNT(DISTINCT product_category) 
  FROM products)
ORDER BY customer_id;

SELECT customer_id
FROM (
  SELECT customers.customer_id
  FROM customer_contracts AS customers
  LEFT JOIN products 
    ON customers.product_id = products.product_id
  GROUP BY customers.customer_id
  HAVING COUNT(DISTINCT products.product_category) = 3
) AS supercloud
ORDER BY customer_id;
