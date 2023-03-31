--https://platform.stratascratch.com/coding/10285-acceptance-rate-by-date?code_type=3

with a as(select *  from fb_friend_requests where action='accepted'),
 b as(select *  from fb_friend_requests  where action='sent')

select b.date,count(a.user_id_receiver)/count(b.user_id_sender) from a right join b on a.user_id_sender=b.user_id_sender
and a.user_id_receiver=b.user_id_receiver group by date;

--another solution
-- acceptance rate = # accepted / total requests
WITH tmp AS (
select user_id_sender, user_id_receiver, MIN(date) AS date,
SUM(case when action = 'accepted' THEN 1 ELSE 0 END) AS accepted_cnt,
SUM(case when action = 'sent' THEN 1 ELSE 0 END) AS sent_cnt
from fb_friend_requests
GROUP BY 1,2
)
SELECT date, SUM(accepted_cnt)/SUM(sent_cnt) AS acceptance_rate
FROM tmp
GROUP BY date;

--anothet solution
select ndate as date, sum(accept_count)/sum(sent_count) as percentage_acceptance FROM (
    select  min(date) as ndate, sum(case when action='sent' then 1 else 0 end) as sent_count, 
    sum(case when action='accepted' then 1 else 0 end) as accept_count   
    from fb_friend_requests
    group by user_id_sender,user_id_receiver ) as s
group by ndate
order by date;
