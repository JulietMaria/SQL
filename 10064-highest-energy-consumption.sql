--https://platform.stratascratch.com/coding/10064-highest-energy-consumption?code_type=3

with ln as  (select date,sum(consumption) as consumption from (
select date,consumption from fb_eu_energy as na
union
select date,consumption from fb_asia_energy as asia
union 
select date,consumption from fb_na_energy as na
) as Data
group by date
) 
select * from ln
where consumption=(select Max(consumption) from ln);
