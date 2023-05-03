--https://platform.stratascratch.com/coding/9688-churro-activity-date?code_type=3

select activity_date,pe_description  from 
los_angeles_restaurant_health_inspections
where facility_name='STREET CHURROS'
and score<95
;
