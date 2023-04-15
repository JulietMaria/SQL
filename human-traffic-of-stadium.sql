--https://leetcode.com/problems/human-traffic-of-stadium/description/

with q1 as (
select *, id - row_number() over() as id_diff
from stadium
where people > 99
)
select id, visit_date, people
from q1
where id_diff in (select id_diff from q1 group by id_diff having count(*) > 2)
order by visit_date;

--https://leetcode.com/problems/human-traffic-of-stadium/solutions/2483315/mysql-3-solutions-no-join-only-windows-function/
