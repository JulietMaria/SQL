--https://platform.stratascratch.com/coding/9650-find-the-top-10-ranked-songs-in-2010?code_type=3

select year_rank, group_name, song_name 
from billboard_top_100_year_end
where year=2010 and year_rank between 1 and 10
group by year_rank;

--another solution
select distinct song_name,group_name,year_rank from billboard_top_100_year_end
where year = "2010"
order by year_rank
limit 10;


select year_rank, group_name, song_name 
from billboard_top_100_year_end
WHERE year = '2010' and YEAR_RANK <=10
group by song_name;
