--https://datalemur.com/questions/second-day-confirmation
SELECT DISTINCT emails.user_id
FROM emails 
JOIN texts
  ON emails.email_id = texts.email_id
WHERE texts.action_date = emails.signup_date + INTERVAL '1 day'
  AND texts.signup_action = 'Confirmed';

/*
In oracle sql
SELECT TO_DATE('30-APR-06') + 1 FROM DUAL;
  -- Adding 1 day to a date
01-MAY-06

In postgresql
date + INTERVAL '1 day'

*/
