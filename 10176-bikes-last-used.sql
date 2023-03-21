--https://platform.stratascratch.com/coding/10176-bikes-last-used?code_type=3


select bike_number, max(end_time) as bike_last_use
from dc_bikeshare_q1_2012
group by bike_number
order by end_time DESC;

//another solution
select DISTINCT bike_number
      ,MAX(end_time) OVER (PARTITION BY bike_number) as last_used
from dc_bikeshare_q1_2012
ORDER BY 2 DESC;
