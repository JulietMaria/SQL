--https://platform.stratascratch.com/coding/9728-inspections-that-resulted-in-violations?code_type=3


select year(inspection_date) as year,count(violation_id) as cnt 
from sf_restaurant_health_violations 
where business_name like '%Roxanne Cafe%' 
and violation_id is not null
group by year
order by year asc;
