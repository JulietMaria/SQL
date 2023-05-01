--https://platform.stratascratch.com/coding/9913-order-details?code_type=3

select c.first_name,o.order_date, o.order_details ,o.total_order_cost
from customers c
inner join orders o
on c.id=o.cust_id
where c.first_name in ('Jill','Eva');
