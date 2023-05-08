--https://platform.stratascratch.com/coding/10026-find-all-wineries-which-produce-wines-by-possessing-aromas-of-plum-cherry-rose-or-hazelnut?code_type=3

select distinct winery
FROM winemag_p1
where lower(description) REGEXP '(plum|rose|cherry|hazelnut)([^a-z])';


--another solution
select distinct winery
from winemag_p1
where 
    description like '%plum %'
    OR description like '%plum,%'
    OR description like '%plum.%'
    OR description like '%cherry%'
    OR description like '% rose%'
    OR description like '%hazelnut%'
order by winery ASC;
