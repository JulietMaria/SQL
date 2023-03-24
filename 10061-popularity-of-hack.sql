--https://platform.stratascratch.com/coding/10061-popularity-of-hack?code_type=3

select fe.location,avg(popularity) as avg_popularity
from facebook_employees fe
left outer join facebook_hack_survey fhs
on fe.id = fhs.employee_id
group by fe.location
;
