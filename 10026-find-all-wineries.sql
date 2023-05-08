--https://platform.stratascratch.com/coding/10026-find-all-wineries-which-produce-wines-by-possessing-aromas-of-plum-cherry-rose-or-hazelnut?code_type=3

select distinct winery
FROM winemag_p1
where lower(description) REGEXP '(plum|rose|cherry|hazelnut)([^a-z])';

/*
The query is filtering the results based on the contents of the "description" column. 
Specifically, it is searching for any description that contains the words "plum", "rose", "cherry", or "hazelnut" 
followed by a non-letter character (such as a space or punctuation mark). 
[descriptions containing any of the specified words]
*/

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
