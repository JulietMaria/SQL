--https://platform.stratascratch.com/coding/10322-finding-user-purchases?code_type=3

select distinct user_id 
from (select *, 
    lead(created_at) over(partition by user_id order by created_at) as next_purchase
    from amazon_transactions) sbqry
where datediff(next_purchase, created_at) <= 7;

//another solution
SELECT a1.user_id
      FROM amazon_transactions as a1
      LEFT JOIN amazon_transactions a2
           ON a1.user_id = a2.user_id
           AND a1.id <> a2.id
     WHERE ABS(DATEDIFF(a1.created_at, a2.created_at)) < 7
     GROUP BY a1.user_id 
     ORDER BY a1.user_id
