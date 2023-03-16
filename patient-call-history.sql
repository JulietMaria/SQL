--https://datalemur.com/questions/patient-call-history

--Solution #1: Using EPOCH()

WITH call_history AS (
SELECT
  policy_holder_id,
  call_received,
   EXTRACT(EPOCH FROM call_received 
     - LAG(call_received) OVER (
  	   PARTITION BY policy_holder_id ORDER BY call_received)
    )/(24*60*60) AS day_difference
FROM callers
)

SELECT COUNT(DISTINCT policy_holder_id) AS patient_count
FROM call_history
WHERE day_difference <= 7;

--Solution #2: Using INTERVAL

WITH calls AS (
SELECT 
  policy_holder_id,
  call_received AS current_call,
  LEAD(call_received) OVER (
    PARTITION BY policy_holder_id ORDER BY call_received) AS next_call
FROM callers
)

SELECT COUNT(DISTINCT policy_holder_id) AS patient_count
FROM calls
WHERE current_call + INTERVAL '168 hours' >= next_call;
