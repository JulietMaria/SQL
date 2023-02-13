--https://datalemur.com/questions/teams-power-users

SELECT sender_id,count(content) as message_count
FROM messages
WHERE EXTRACT(MONTH FROM sent_date) = '8'
AND EXTRACT(YEAR FROM sent_date) = '2022'
GROUP BY sender_id
ORDER BY message_count DESC
LIMIT 2
;
