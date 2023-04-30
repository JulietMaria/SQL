--https://leetcode.com/problems/not-boring-movies/description/

Select *
from Cinema
where description!='boring'
and id%2!=0
order by rating desc;

--another solution
SELECT * FROM cinema WHERE (id % 2 = 1) AND (description <> 'boring') ORDER BY rating DESC;
