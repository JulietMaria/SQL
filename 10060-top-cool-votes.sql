--https://platform.stratascratch.com/coding/10060-top-cool-votes?code_type=3

select business_name,review_text 
from yelp_reviews y
where cool = (select max(cool) from yelp_reviews)
;

--another solution
SELECT business_name, review_text
FROM yelp_reviews
ORDER BY cool DESC
LIMIT 2;

--another solution
WITH CTE as (SELECT *, RANK() OVER(ORDER BY cool DESC) AS ranking
FROM yelp_reviews) 
SELECT business_name, review_text 
FROM CTE
WHERE ranking = 1;
