--https://platform.stratascratch.com/coding/514-marketing-campaign-success-advanced?code_type=3

SELECT
    COUNT(DISTINCT user_id) total_users
FROM
(
    SELECT
        user_id, created_at, 
        DENSE_RANK() OVER(partition by user_id order by created_at) date_rnk,
        DENSE_RANK() OVER(partition by user_id, product_id order by created_at) product_rnk
    FROM marketing_campaign
) t1
WHERE date_rnk > 1 AND product_rnk = 1;


/*
This query uses a subquery to rank the purchases by date and product. 
It then selects only the users who made their first purchase more than one day before the start of the campaign and who made additional purchases after that first day. 
The COUNT(DISTINCT user_id) function counts the number of unique users who meet these criteria.
*/
