--https://platform.stratascratch.com/coding/9653-count-the-number-of-user-events-performed-by-macbookpro-users?code_type=3

select event_name,count(event_name) as event_count 
from playbook_events
where device='macbook pro'
group by event_name
order by event_count desc;
