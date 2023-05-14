--https://platform.stratascratch.com/coding/9782-customer-revenue-in-march?code_type=3

SELECT cust_id, SUM(total_order_cost) as revenue FROM orders
WHERE order_date LIKE '%2019-03%'
GROUP BY cust_id
ORDER BY revenue DESC;

--another solution
select cust_id, SUM(total_order_cost) as revenue 
from orders
WHERE MONTH(order_date) = 3 and YEAR(order_date) = 2019
group by cust_id
order by revenue desc;

select 
cust_id,
SUM(total_order_cost) as total_revenue
from 
    orders 
where order_date like "2019-03%"
group by 1
order by 2 desc;

SELECT cust_id,
       SUM(total_order_cost) AS revenue
  FROM orders
 WHERE DATE(order_date) BETWEEN '2019-03-01' AND '2019-03-31'
 GROUP BY cust_id
 ORDER BY SUM(total_order_cost) DESC;
 
 
 
