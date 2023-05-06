--https://platform.stratascratch.com/coding/10049-reviews-of-categories?code_type=3

--https://python.plainenglish.io/crack-sql-interview-question-unnest-string-to-array-1b75578cbe75 

---MySql
with recursive num (n) as (
-- create list 1 - 15
    select 1
    union all
    select n+1 from num where n<12
)
select 
    substring_index(substring_index(categories,';',n),';',-1) as category,
    sum(review_count) as review_cnt
from 
    yelp_business
    inner join 
    num
on 
    n <= char_length(categories) - char_length(replace(categories,';','')) + 1
group by
    category;

--SQL
WITH cte AS(
SELECT
UNNEST(STRING_TO_ARRAY(categories, ';')) AS category ,
review_count
FROM yelp_business
)
SELECT
category,
SUM(review_count) AS review_cnt
FROM cte
GROUP BY category
ORDER BY review_cnt DESC;
