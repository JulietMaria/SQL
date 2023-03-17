--https://datalemur.com/questions/long-calls-growth

WITH calls AS (
SELECT 
  EXTRACT(YEAR FROM call_received) AS yr,
  EXTRACT(MONTH FROM call_received) AS mth,
  COUNT(case_id) AS curr_mth_call,
  LAG(COUNT(case_id)) OVER (
    ORDER BY EXTRACT(MONTH FROM call_received)) AS prev_mth_call
FROM callers
WHERE call_duration_secs > 300
GROUP BY 
  EXTRACT(YEAR FROM call_received),
  EXTRACT(MONTH FROM call_received)
)

SELECT
  yr,
  mth,
  ROUND(100.0 * 
    (curr_mth_call - prev_mth_call)/prev_mth_call,1) AS growth_pct
FROM calls
ORDER BY yr, mth;

--https://www.postgresqltutorial.com/postgresql-window-function/postgresql-lag-function/
