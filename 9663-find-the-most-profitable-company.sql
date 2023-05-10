--https://platform.stratascratch.com/coding/9663-find-the-most-profitable-company-in-the-financial-sector-of-the-entire-world-along-with-its-continent?code_type=3

SELECT company, continent
FROM forbes_global_2010_2014
WHERE sector = 'Financials'
ORDER BY profits DESC
LIMIT 1;

--other solutions
select company, continent from forbes_global_2010_2014
where profits in(
select MAX(profits)
from forbes_global_2010_2014 t
where sector = 'Financials');

select company, continent
from forbes_global_2010_2014
where sector = 'financials'
having max(profits);

select company,continent,max(profits) as Profit
from forbes_global_2010_2014
where sector='Financials'
limit 1;

select company, continent from forbes_global_2010_2014 order by profits desc limit 1;

