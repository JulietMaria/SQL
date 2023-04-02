--https://platform.stratascratch.com/coding/10156-number-of-units-per-nationality?code_type=3

select h.nationality, count(distinct u.unit_id) cnt
from airbnb_hosts h
join airbnb_units u
on h.host_id = u.host_id
where h.age < 30 and u.unit_type = 'Apartment'
group by h.nationality
order by cnt desc;
