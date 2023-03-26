--https://platform.stratascratch.com/coding/10354-most-profitable-companies?code_type=3

SELECT company, profits 
FROM forbes_global_2010_2014
ORDER BY profits DESC 
LIMIT 3;

//another solution
WITH T AS
(
    SELECT
        company, profits,
        DENSE_RANK() OVER (ORDER by profits DESC) AS r
    FROM forbes_global_2010_2014
)

SELECT  
    company, profits
FROM T
WHERE r IN (1,2,3);

//another solution
with cte as (select company, profits, rank()over( order by profits desc) rk
from forbes_global_2010_2014)
select company, profits from cte 
where rk<=3
