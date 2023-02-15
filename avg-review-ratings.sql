--https://datalemur.com/questions/sql-avg-review-ratings
SELECT  EXTRACT(MONTH FROM submit_date) as mth,
product_id as product,
ROUND(AVG(stars),2) as avg_stars
FROM reviews
GROUP BY mth,product
ORDER BY mth,product
;
