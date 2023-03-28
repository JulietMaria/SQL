--https://platform.stratascratch.com/coding/10352-users-by-avg-session-time?code_type=3

SELECT user_id, AVG(TIMESTAMPDIFF(SECOND, load_time, exit_time)) AS session_time
FROM (
    SELECT 
        DATE(timestamp), 
        user_id, 
        MAX(IF(action = 'page_load', timestamp, NULL)) as load_time,
        MIN(IF(action = 'page_exit', timestamp, NULL)) as exit_time
    FROM facebook_web_log
    GROUP BY 1, 2
) t 
GROUP BY user_id
HAVING session_time IS NOT NULL;

--another solution
--https://python.plainenglish.io/part-1-solve-sql-problems-asked-by-product-based-companies-8adf44f3b9dc
select user_id, avg(e_time — l_time) as avg_session_time from 
(select user_id,
max(case when action = ‘page_load’ then timestamp end) as l_time,
min(case when action = ‘page_exit’ then timestamp end) as e_time from facebook_web_log
group by user_id, date(timestamp)) as A 
group by user_id 
having avg(e_time — l_time) is not null;

--https://medium.com/@festusmorumbasi/working-with-dates-on-sql-practice-example-1-self-join-b2295be2cbf3
with CTE as (
 SELECT t1.user_id, 
        t1.timestamp::date as date,
        min(t2.timestamp::TIMESTAMP) — max(t1.timestamp::TIMESTAMP)               
        as session_duration
 FROM facebook_web_log t1
   JOIN facebook_web_log t2 
   ON t1.user_id = t2.user_id
 WHERE t1.action = ‘page_load’ 
   AND t2.action = ‘page_exit’ 
   AND t2.timestamp > t1.timestamp
 GROUP BY 1, 2)
SELECT user_id, avg(session_duration) FROM CTE
GROUP BY user_id;


