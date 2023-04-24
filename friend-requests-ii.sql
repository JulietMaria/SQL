--https://leetcode.com/problems/friend-requests-ii-who-has-the-most-friends/description/

select 
    requester_id as id,
    (   select count(t.requester_id) 
        from RequestAccepted t
        where t.requester_id = id or t.accepter_id = id
    ) as num
from RequestAccepted
group by id
order by num desc
limit 1;

--another solution

select id, count(*) num from 
(
      (select requester_id id from RequestAccepted) 
      union all 
      (select accepter_id id from RequestAccepted)
) tb 
group by id order by num desc limit 1;
