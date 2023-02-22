--https://datalemur.com/questions/total-drugs-sales

SELECT manufacturer,CONCAT('$', ROUND(SUM(total_sales) / 1000000), ' million') as sales
FROM pharmacy_sales
GROUP BY manufacturer
ORDER BY SUM(total_sales) desc;
/*
order the results by the total sales in descending order. 
sales column is now a STRING data type. 
To order it by the total sales.so use ORDER BY SUM(total_sales) desc
*/
